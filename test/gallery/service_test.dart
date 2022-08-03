import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_pictures/service/gallery.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('GalleryService', () {
    late GalleryService service;

    setUp(() {
      service = GalleryService();
    });

    test('parsed raw data from assets', () async {
      final data = await service.getRawData();
      expect(data, isA<Iterable>());
      expect(data, isNotEmpty);
    });

    test('paginated data serialized into a data model', () async {
      final data = await service.getRawData();

      final int total = data.length;

      const size = 10;
      final totalPages = total ~/ size;

      for (var page = 0; page < totalPages; page++) {
        final pageData = await service.getPictures(page, size);
        expect(
          pageData,
          isNotEmpty,
          reason: 'Failed to get data for page $page',
        );
      }
    });

    test('Check out of range queries', () async {
      const size = 10;

      final data = await service.getRawData();
      final count = data.length;

      final positiveOutOfRangeQuery = await service.getPictures(
        count,
        size,
      );

      final negativeOutOfRangeQuery = await service.getPictures(
        -1,
        size,
      );

      expect(
        positiveOutOfRangeQuery,
        isNot(throwsRangeError),
        reason: 'Must not fail with range error',
      );

      expect(
        positiveOutOfRangeQuery,
        isEmpty,
        reason: 'Must return empty for page index out of range',
      );

      expect(
        negativeOutOfRangeQuery,
        isNot(throwsRangeError),
        reason: 'Must not fail with range error',
      );

      expect(
        negativeOutOfRangeQuery,
        isEmpty,
        reason: 'Must return empty for page index out of range',
      );
    });

    test('all elements should be unique', () async {
      final data = await service.getRawData();
      final unique = data.toSet();

      expect(data, isNotEmpty);
      expect(unique, isNotEmpty);

      expect(
        unique,
        hasLength(data.length),
        reason:
            'unique elements have length: ${unique.length} and original data had length: ${data.length}',
      );
    });
  });
}
