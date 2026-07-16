import '../../utils/connection.dart';
import '../db.dart';

AppDatabase $userAccount(String databaseName) {
  final _dbConnectionProvider = DatabaseConnectionProvider(databaseName);

  return AppDatabase.connect(_dbConnectionProvider.fromBackground);
}
