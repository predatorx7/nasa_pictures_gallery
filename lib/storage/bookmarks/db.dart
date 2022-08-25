import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'dao/bookmarks.dart';
import 'table/bookmarks.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [
    Bookmarks,
  ],
  daos: [
    BookmarksDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  /// Creates database connection from a custom database connection and returns a database instance.
  AppDatabase.connect(DatabaseConnection c) : super.connect(c);

  @override
  int get schemaVersion => 1;

  static const bool _deleteEverythingBeforeStartupInDebug = false;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) {
      return m.createAll();
    }, beforeOpen: (details) async {
      if (kDebugMode && _deleteEverythingBeforeStartupInDebug) {
        final m = Migrator(this);
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }
      }
    });
  }
}
