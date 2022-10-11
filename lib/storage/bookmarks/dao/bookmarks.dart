import 'package:drift/drift.dart';
import 'package:nasa_pictures/data/picture.dart';

import '../db.dart';
import '../table/bookmarks.dart';

part 'bookmarks.g.dart';

@DriftAccessor(tables: [Bookmarks])
class BookmarksDao extends DatabaseAccessor<AppDatabase>
    with _$BookmarksDaoMixin {
  BookmarksDao(AppDatabase db) : super(db);

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
    return into(bookmarks).insert(BookmarksCompanion.insert(
      title: Value.ofNullable(picture.title),
      date: date,
      hdurl: Value.ofNullable(picture.hdurl),
      explanation: Value.ofNullable(picture.explanation),
      url: Value.ofNullable(picture.url),
      mediaType: Value.ofNullable(picture.mediaType),
      serviceVersion: Value.ofNullable(picture.serviceVersion),
      copyright: Value.ofNullable(picture.copyright),
    ));
  }
}
