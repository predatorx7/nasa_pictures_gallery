import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

import '../../configs/logging.dart';
import '../db.dart';

QueryExecutor _getDatabaseQueryExecutor(String databaseName) {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: databaseName,
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      logging.warning(
        'Using ${result.chosenImplementation} due to unsupported '
        'browser features: ${result.missingFeatures}',
      );
    }

    return result.resolvedExecutor;
  });
}

AppDatabase $userAccount(String databaseName) {
  return AppDatabase(_getDatabaseQueryExecutor(databaseName));
}
