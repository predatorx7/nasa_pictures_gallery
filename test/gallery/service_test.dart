import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/service/gallery.dart';

import '../data/gallery_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final List<GalleryService Function()> galleryServices = [
    GalleryService.new,
    () {
      return FakeGalleryService(GalleryFakeData.single);
    },
    () {
      return FakeGalleryService(GalleryFakeData.twoDifferent);
    },
    () {
      return FakeGalleryService(GalleryFakeData.empty);
    },
  ];

  for (var createGalleryService in galleryServices) {
    group('GalleryService', () {
      late GalleryService service;

      setUp(() {
        service = createGalleryService();
      });

      test('decoding & serialization of raw data from assets', () async {
        final data = await service.getRawData();
        expect(data, isA<Iterable>());
        expect(SamplePicture.fromJsonList(data), isA<List<SamplePicture>>());
        expect(SamplePicture.fromJsonList(data).length, data.length);
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

        expect(
          unique,
          hasLength(data.length),
          reason:
              'unique elements have length: ${unique.length} and original data had length: ${data.length}',
        );
      });

      test('item count of fetched equals to the total', () async {
        final data = await service.getRawData();
        final totalCount = data.length;

        const size = 10;
        int page = 0;

        int lastPageSize = -1;
        int totalFetched = 0;

        do {
          final items = await service.getPictures(page, size);
          lastPageSize = items.length;
          totalFetched += items.length;
          page += 1;
          // print('start page: $page\n ${items.map((e) => e.title).join("\n ")}\nsize: $lastPageSize end');
        } while (lastPageSize == size);

        expect(totalFetched, totalCount);
      });

      test('data must be sorted chronologically with latest first', () async {
        const size = 10;
        int page = 0;

        int lastPageSize = -1;
        SamplePicture? lastItem;

        do {
          final items = await service.getPictures(page, size);
          lastPageSize = items.length;
          for (final it in items) {
            if (lastItem != null) {
              expect(
                lastItem.date?.compareTo(it.date ?? ''),
                greaterThanOrEqualTo(0),
                reason:
                    '${lastItem.date} should be arranged before ${it.date}. Because the actual result is reversed to present items in descending order by date, we are expecting comparison value to be positive (Default value for default sorting i.e ascending).',
              );
            }
            lastItem = it;
          }
          page += 1;
        } while (lastPageSize == size);
      });
    });
  }
}
