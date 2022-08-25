import 'package:drift/drift.dart';

class Bookmarks extends Table {
  @override
  Set<Column<Object>>? get primaryKey => {date};

  TextColumn get copyright => text()();

  TextColumn get date => text()();

  TextColumn get explanation => text()();

  TextColumn get hdurl => text()();

  TextColumn get mediaType => text()();

  TextColumn get serviceVersion => text()();

  TextColumn get title => text()();

  TextColumn get url => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
