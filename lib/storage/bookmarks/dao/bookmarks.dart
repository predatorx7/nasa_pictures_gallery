import 'package:drift/drift.dart';

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
}
