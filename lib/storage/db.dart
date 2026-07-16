import 'package:drift/drift.dart';

part 'db.g.dart';

@DriftDatabase(
  include: {
    'sql/tables.drift',
    'sql/bookmarks.drift',
    'sql/apod_entries.drift',
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  /// Creates database connection from a custom database connection and returns a database instance.
  AppDatabase.connect(super.c) : super.connect();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) => m.createAll());
  }
}
