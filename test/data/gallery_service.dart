import 'package:intl/intl.dart' as intl;
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/service/gallery.dart';

String _iso(DateTime date) => intl.DateFormat('yyyy-MM-dd').format(date);

/// A [GalleryService] fake that serves fixed, date-tagged entries instead of
/// hitting the network. [fetchRange] mimics the real API by only returning
/// entries whose date falls within the requested window.
class FakeGalleryService extends GalleryService {
  FakeGalleryService(this.data);

  final List<Map<String, String>> data;

  int fetchCallCount = 0;

  @override
  Future<List<SamplePicture>> fetchRange(DateTime start, DateTime end) async {
    fetchCallCount++;
    final startStr = _iso(start);
    final endStr = _iso(end);
    return data
        .where((e) {
          final date = e['date']!;
          return date.compareTo(startStr) >= 0 && date.compareTo(endStr) <= 0;
        })
        .map(SamplePicture.fromJson)
        .toList();
  }
}

class GalleryFakeData {
  // The repository never requests a window that includes today (NASA
  // rejects end_date >= today), so fixture dates must be from yesterday back.
  static final DateTime latest = DateTime.now().subtract(const Duration(days: 1));
  static final DateTime dayBeforeLatest = latest.subtract(const Duration(days: 1));

  static final single = [
    {
      "copyright": "Colleen Pinski",
      "date": _iso(latest),
      "explanation":
          "What is this person doing?  In 2012 an annular eclipse of the Sun was visible over a narrow path that crossed the northern Pacific Ocean and several western US states.  In an annular solar eclipse, the Moon is too far from the Earth to block out the entire Sun, leaving the Sun peeking out over the Moon's disk in a ring of fire.  To capture this unusual solar event, an industrious photographer drove from Arizona to New Mexico to find just the right vista. After setting up and just as the eclipsed Sun was setting over a ridge about 0.5 kilometers away, a person unknowingly walked right into the shot. Although grateful for the unexpected human element, the photographer never learned the identity of the silhouetted interloper. It appears likely, though, that the person is holding a circular device that would enable them to get their own view of the eclipse.  The shot was taken at sunset on 2012 May 20 at 7:36 pm local time from a park near Albuquerque, New Mexico, USA. Tomorrow another annular solar eclipse will become visible, this time along a thin path starting in Saudi Arabia and going through southern India, Singapore, and Guam.   However, almost all of Asia with a clear sky will be able to see, tomorrow, at the least, a partial solar eclipse.    Free Download: 2020 APOD Calendar",
      "hdurl":
          "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_1522.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "An Annular Solar Eclipse over New Mexico",
      "url":
          "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_960.jpg",
    },
  ];

  static final twoDifferent = [
    {
      "copyright": "Colleen Pinski",
      "date": _iso(latest),
      "explanation":
          "What is this person doing?  In 2012 an annular eclipse of the Sun was visible over a narrow path that crossed the northern Pacific Ocean and several western US states.  In an annular solar eclipse, the Moon is too far from the Earth to block out the entire Sun, leaving the Sun peeking out over the Moon's disk in a ring of fire.  To capture this unusual solar event, an industrious photographer drove from Arizona to New Mexico to find just the right vista. After setting up and just as the eclipsed Sun was setting over a ridge about 0.5 kilometers away, a person unknowingly walked right into the shot. Although grateful for the unexpected human element, the photographer never learned the identity of the silhouetted interloper. It appears likely, though, that the person is holding a circular device that would enable them to get their own view of the eclipse.  The shot was taken at sunset on 2012 May 20 at 7:36 pm local time from a park near Albuquerque, New Mexico, USA. Tomorrow another annular solar eclipse will become visible, this time along a thin path starting in Saudi Arabia and going through southern India, Singapore, and Guam.   However, almost all of Asia with a clear sky will be able to see, tomorrow, at the least, a partial solar eclipse.    Free Download: 2020 APOD Calendar",
      "hdurl":
          "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_1522.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "An Annular Solar Eclipse over New Mexico",
      "url":
          "https://apod.nasa.gov/apod/image/1912/AnnularEclipse_Pinski_960.jpg",
    },
    {
      "copyright": "Tomas Slovinsky",
      "date": _iso(dayBeforeLatest),
      "explanation":
          "What stars shine in Earth's northern hemisphere during winter? The featured image highlights a number of bright stars visible earlier this month. The image is a 360-degree horizontal-composite panorama of 66 vertical frames taken consecutively with the same camera and from the same location at about 2:30 am. Famous stars visible in the picture include Castor & Pollux toward the southeast on the left, Sirius just over the horizon toward the south, Capella just over the arch of the Milky Way Galaxy toward the west, and Polaris toward the north on the right.  Captured by coincidence is a meteor on the far left.  In the foreground is the Museum of the Orava Village in Zuberec, Slovakia. This village recreates rural life in the region hundreds of years ago, while the image captures a timeless sky surely familar to village residents, a sky also shared with northern residents around the world.    Free Download: 2020 APOD Calendar",
      "hdurl":
          "https://apod.nasa.gov/apod/image/1912/WinterStars_Slovinsky_2048.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "A Northern Winter Sky Panorama",
      "url":
          "https://apod.nasa.gov/apod/image/1912/WinterStars_Slovinsky_1080.jpg",
    },
  ];

  static final empty = <Map<String, String>>[];
}
