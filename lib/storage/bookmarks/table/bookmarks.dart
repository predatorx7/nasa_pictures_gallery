import 'package:drift/drift.dart';

class Bookmarks extends Table {
  @override
  Set<Column<Object>>? get primaryKey => {date};

  TextColumn get copyright => text().nullable()();

  TextColumn get date => text()();

  TextColumn get explanation => text().nullable()();

  TextColumn get hdurl => text().nullable()();

  TextColumn get mediaType => text().nullable()();

  TextColumn get serviceVersion => text().nullable()();

  TextColumn get title => text().nullable()();

  TextColumn get url => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
