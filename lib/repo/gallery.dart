import 'package:intl/intl.dart' as intl;
import 'package:nasa_pictures/configs/logging.dart';

import '../data/picture.dart';
import '../service/gallery.dart';
import '../storage/apod/mapper.dart';
import '../storage/db.dart';

class GalleryRepository {
  final GalleryService service;
  final AppDatabase db;

  GalleryRepository(this.service, this.db);

  /// The first APOD was published on this date; pagination never goes past it.
  static final DateTime _launchDate = DateTime(1995, 6, 16);

  static String _iso(DateTime date) =>
      intl.DateFormat('yyyy-MM-dd').format(date);

  Future<List<SamplePicture>> getPictures({int page = 0, int size = 10}) async {
    assert(page >= 0, 'page must be a positive integer');
    assert(size > 0, 'size should be greater than 0');

    try {
      // NASA's API rejects `end_date` values of today (and later), so the
      // most recent date it will ever serve is yesterday. Anchoring
      // pagination there also means every cached window is final/immutable
      // the moment it's fetched — no "is this row stale" bookkeeping needed.
      final latestAvailable = DateTime.now().subtract(const Duration(days: 1));
      final launchStr = _iso(_launchDate);
      final latestStr = _iso(latestAvailable);

      final offset = page * size;
      final needed = offset + size;

      var all = await db.getApodEntriesInRange(launchStr, latestStr).get();

      // NASA also publishes non-image (video) days, which we don't store.
      // A fixed calendar window can't guarantee `size` image entries, so
      // keep extending the fetched range backward — independent of what
      // ends up cached — until we have enough, or run out of history.
      var cursorEnd = latestAvailable;
      while (all.length < needed && !cursorEnd.isBefore(_launchDate)) {
        var cursorStart = cursorEnd.subtract(Duration(days: size - 1));
        if (cursorStart.isBefore(_launchDate)) cursorStart = _launchDate;

        final cursorStartStr = _iso(cursorStart);
        final cursorEndStr = _iso(cursorEnd);

        final alreadyCached = await db
            .getApodEntriesInRange(cursorStartStr, cursorEndStr)
            .get();

        if (alreadyCached.isEmpty) {
          final fetched = await service.fetchRange(cursorStart, cursorEnd);
          await db.transaction(() async {
            for (final picture in fetched) {
              final date = picture.date;
              if (date == null) continue;
              await db.upsertApodEntry(
                date,
                picture.copyright,
                picture.explanation,
                picture.hdurl,
                picture.mediaType,
                picture.serviceVersion,
                picture.title,
                picture.url,
              );
            }
          });
        }

        all = await db.getApodEntriesInRange(launchStr, latestStr).get();

        if (cursorStart == _launchDate) break;
        cursorEnd = cursorStart.subtract(const Duration(days: 1));
      }

      if (offset >= all.length) return [];
      final end = (offset + size) > all.length ? all.length : offset + size;
      return all.sublist(offset, end).map((r) => r.toPicture()).toList();
    } catch (e, s) {
      logging.severe(
        'Failed to get pictures of page $page and size $size',
        e,
        s,
      );
      rethrow;
    }
  }

  Future<int> getTotalPictureCount() async {
    try {
      final days = DateTime.now().difference(_launchDate).inDays;
      return days;
    } catch (e, s) {
      logging.severe('Failed to get total picture count', e, s);
      return 0;
    }
  }
}
