import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/repo/gallery.dart';
import 'package:nasa_pictures/service/gallery.dart';
import 'package:nasa_pictures/storage/db.dart';

/// A [GalleryService] fake that synthesizes one image entry per day of the
/// requested range, so every window the repository asks for resolves to
/// non-empty, distinguishable data.
class GeneratingFakeGalleryService extends GalleryService {
  int fetchCallCount = 0;

  @override
  Future<List<SamplePicture>> fetchRange(DateTime start, DateTime end) async {
    fetchCallCount++;
    final days = end.difference(start).inDays + 1;
    return List.generate(days, (i) {
      final date = start.add(Duration(days: i));
      final dateStr = intl.DateFormat('yyyy-MM-dd').format(date);
      return SamplePicture(
        date: dateStr,
        title: 'Title $dateStr',
        mediaType: 'image',
      );
    });
  }
}

/// A [GalleryService] fake that synthesizes one image entry per day (like
/// [GeneratingFakeGalleryService]) while also recording the `end` of every
/// requested range.
class _RecordingFakeGalleryService extends GalleryService {
  _RecordingFakeGalleryService(this.requestedEnds);

  final List<DateTime> requestedEnds;

  @override
  Future<List<SamplePicture>> fetchRange(DateTime start, DateTime end) async {
    requestedEnds.add(end);
    final days = end.difference(start).inDays + 1;
    return List.generate(days, (i) {
      final date = start.add(Duration(days: i));
      final dateStr = intl.DateFormat('yyyy-MM-dd').format(date);
      return SamplePicture(
        date: dateStr,
        title: 'Title $dateStr',
        mediaType: 'image',
      );
    });
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('For the Gallery Repository', () {
    late GalleryRepository repository;
    late GeneratingFakeGalleryService service;
    late AppDatabase db;

    setUp(() {
      service = GeneratingFakeGalleryService();
      db = AppDatabase(NativeDatabase.memory());
      repository = GalleryRepository(service, db);
    });

    tearDown(() async {
      await db.close();
    });

    test(
      'equality of values returned from same query multiple times',
      () async {
        const page1 = 0;
        const size1 = 10;
        final a1 = await repository.getPictures(page: page1, size: size1);
        final a2 = await repository.getPictures(page: page1, size: size1);
        expect(a1, a2);

        final b1 = await repository.getPictures(page: page1 + 1, size: size1);
        expect(a1, isNot(b1));
      },
    );

    test('illegal arguments', () async {
      expect(
        () => repository.getPictures(page: -1, size: 10),
        throwsAssertionError,
      );

      expect(
        () => repository.getPictures(page: 0, size: -10),
        throwsAssertionError,
      );

      await expectLater(
        repository.getPictures(page: 0, size: 10),
        completes,
      );
    });

    test('a page is only fetched from the network once', () async {
      // Every window is anchored at "yesterday" (NASA rejects end_date ==
      // today), so once a window is cached it is permanently final.
      for (final page in [0, 1]) {
        final callsBefore = service.fetchCallCount;
        await repository.getPictures(page: page, size: 10);
        expect(service.fetchCallCount, callsBefore + 1);

        await repository.getPictures(page: page, size: 10);
        expect(
          service.fetchCallCount,
          callsBefore + 1,
          reason: 'a fully-cached window must not be refetched',
        );
      }
    });

    test('never requests a window ending today or later', () async {
      final requestedEnds = <DateTime>[];
      final service = _RecordingFakeGalleryService(requestedEnds);
      final repository = GalleryRepository(service, db);

      await repository.getPictures(page: 0, size: 10);

      final today = DateTime.now();
      for (final end in requestedEnds) {
        expect(
          end.isBefore(DateTime(today.year, today.month, today.day)),
          isTrue,
          reason: 'NASA rejects end_date >= today; window end was $end',
        );
      }
    });

    test('pagination stops once past the APOD launch date', () async {
      final daysSinceLaunch = DateTime.now()
          .difference(DateTime(1995, 6, 16))
          .inDays;

      // A large page size keeps the walk back to the launch date to a
      // handful of iterations instead of one per `size`-day window.
      const size = 2000;
      final farBackPage = (daysSinceLaunch ~/ size) + 2;

      final result = await repository.getPictures(
        page: farBackPage,
        size: size,
      );
      expect(
        result,
        isEmpty,
        reason: 'a page entirely past the launch date has no more history',
      );
    });
  });
}
