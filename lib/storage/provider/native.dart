import '../../utils/connection.dart';
import '../bookmarks/db.dart';

AppDatabase $userAccount(String databaseName) {
  final _dbConnectionProvider = DatabaseConnectionProvider(databaseName);

  return AppDatabase.connect(_dbConnectionProvider.fromBackground);
}
