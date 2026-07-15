import 'package:drift/drift.dart';
import 'package:nasa_pictures/data/picture.dart';

import '../db.dart';
import '../table/bookmarks.dart';

part 'bookmarks.g.dart';

@DriftAccessor(tables: [Bookmarks])
class BookmarksDao extends DatabaseAccessor<AppDatabase>
    with _$BookmarksDaoMixin {
  BookmarksDao(super.db);

  Future<List<Bookmark>> getAll() {
    return select(bookmarks).get();
  }

  Stream<List<Bookmark>> getAllAsStream() {
    return select(bookmarks).watch();
  }

  Future<Bookmark?> getBookmarkByDate(String date) {
    final q = select(bookmarks);
    q.where((tbl) => tbl.date.equals(date));
    return q.getSingleOrNull();
  }

  Future<int> saveBookmarkByDate(SamplePicture picture) async {
    final date = picture.date;
    if (date == null) {
      throw ArgumentError.notNull('picture.date');
    }
    return into(bookmarks).insert(
      BookmarksCompanion.insert(
        title: Value.absentIfNull(picture.title),
        date: date,
        hdurl: Value.absentIfNull(picture.hdurl),
        explanation: Value.absentIfNull(picture.explanation),
        url: Value.absentIfNull(picture.url),
        mediaType: Value.absentIfNull(picture.mediaType),
        serviceVersion: Value.absentIfNull(picture.serviceVersion),
        copyright: Value.absentIfNull(picture.copyright),
      ),
    );
  }
}
