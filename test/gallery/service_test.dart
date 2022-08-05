import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/service/gallery.dart';

class FakeGalleryService extends GalleryService {
  final dynamic fakeRawData;

  FakeGalleryService(this.fakeRawData);

  @override
  Future<dynamic> getRawData() => Future.value(fakeRawData);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final List<GalleryService Function()> galleryServices = [
    GalleryService.new,
    () {
      return FakeGalleryService([
        {
          "copyright": "Colleen Pinski",
          "date": "2019-12-25",
          "explanation":
              "What is this person doing?  In 2012 an annular eclipse of the Sun was visible over a narrow path that crossed the northern Pacific Ocean and several western US states.  In an annular solar eclipse, the Moon is too far from the Earth to block out the entire Sun, leaving the Sun peeking out over the Moon's disk in a ring of fire.  To capture this unusual solar event, an industrious photographer drove from Arizona to New Mexico to find just the right vista. After setting up and just as the eclipsed Sun was setting over a ridge about 0.5 kilometers away, a person unknowingly walked right into the shot. Although grateful for the unexpected human element, the photographer never learned the identity of the silhouetted interloper. It appears likely, though, that the person is holding a circular device that would enable them to get their own view of the eclipse.  The shot was taken at sunset on 2012 May 20 at 7:36 pm local time from a park near Albuquerque, New Mexico, USA. Tomorrow another annular solar eclipse will become visible, this time along a thin path starting in Saudi Arabia and going through southern India, Singapore, and Guam.   However, almost all of Asia with a clear sky will be able to see, tomorrow, at the least, a partial solar eclipse.    Free Download: 2020 APOD Calendar",
          "hdurl":
              "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_1522.jpg",
          "media_type": "image",
          "service_version": "v1",
          "title": "An Annular Solar Eclipse over New Mexico",
          "url":
              "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_960.jpg"
        },
      ]);
    },
    () {
      return FakeGalleryService([
        {
          "copyright": "Colleen Pinski",
          "date": "2019-12-25",
          "explanation":
              "What is this person doing?  In 2012 an annular eclipse of the Sun was visible over a narrow path that crossed the northern Pacific Ocean and several western US states.  In an annular solar eclipse, the Moon is too far from the Earth to block out the entire Sun, leaving the Sun peeking out over the Moon's disk in a ring of fire.  To capture this unusual solar event, an industrious photographer drove from Arizona to New Mexico to find just the right vista. After setting up and just as the eclipsed Sun was setting over a ridge about 0.5 kilometers away, a person unknowingly walked right into the shot. Although grateful for the unexpected human element, the photographer never learned the identity of the silhouetted interloper. It appears likely, though, that the person is holding a circular device that would enable them to get their own view of the eclipse.  The shot was taken at sunset on 2012 May 20 at 7:36 pm local time from a park near Albuquerque, New Mexico, USA. Tomorrow another annular solar eclipse will become visible, this time along a thin path starting in Saudi Arabia and going through southern India, Singapore, and Guam.   However, almost all of Asia with a clear sky will be able to see, tomorrow, at the least, a partial solar eclipse.    Free Download: 2020 APOD Calendar",
          "hdurl":
              "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_1522.jpg",
          "media_type": "image",
          "service_version": "v1",
          "title": "An Annular Solar Eclipse over New Mexico",
          "url":
              "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_960.jpg"
        },
        {
          "copyright": "Tomas Slovinsky",
          "date": "2019-12-24",
          "explanation":
              "What stars shine in Earth's northern hemisphere during winter? The featured image highlights a number of bright stars visible earlier this month. The image is a 360-degree horizontal-composite panorama of 66 vertical frames taken consecutively with the same camera and from the same location at about 2:30 am. Famous stars visible in the picture include Castor & Pollux toward the southeast on the left, Sirius just over the horizon toward the south, Capella just over the arch of the Milky Way Galaxy toward the west, and Polaris toward the north on the right.  Captured by coincidence is a meteor on the far left.  In the foreground is the Museum of the Orava Village in Zuberec, Slovakia. This village recreates rural life in the region hundreds of years ago, while the image captures a timeless sky surely familar to village residents, a sky also shared with northern residents around the world.    Free Download: 2020 APOD Calendar",
          "hdurl":
              "https://apod.nasa.gov/apod/image/1912/WinterStars_Slovinsky_2048.jpg",
          "media_type": "image",
          "service_version": "v1",
          "title": "A Northern Winter Sky Panorama",
          "url":
              "https://apod.nasa.gov/apod/image/1912/WinterStars_Slovinsky_1080.jpg"
        },
      ]);
    },
    () {
      return FakeGalleryService([]);
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
