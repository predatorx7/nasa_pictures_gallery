// ignore_for_file: unused_element
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:drift/drift.dart';
import 'package:drift/remote.dart';
import 'package:flutter/foundation.dart';

import '../../configs/logging.dart';
import 'package:drift/web.dart';

import '../bookmarks/db.dart';

// ISSUE: Always throws failed to fetch a service worker
DatabaseConnection _connectToWorker(String databaseName) {
  const workerPath =
      kReleaseMode ? 'dart_worker.dart.min.js' : 'dart_worker.dart.js';

  final worker = SharedWorker(
    workerPath,
    databaseName,
  );

  worker.onError.asBroadcastStream().listen((event) {
    logging.warning('worker error stream', event);
  });

  return remote(worker.port!.channel());
}

LazyDatabase _getLazyDatabaseQueryExecutor(String databaseName) {
  return LazyDatabase(() async {
    final dbStorage = await DriftWebStorage.indexedDbIfSupported(databaseName);

    return WebDatabase.withStorage(dbStorage);
  });
}

WebDatabase _getDatabaseQueryExecutor(String databaseName) {
  return WebDatabase(databaseName);
}

AppDatabase $userAccount(String databaseName) {
  final dbqe = _getLazyDatabaseQueryExecutor(databaseName);
  return AppDatabase(dbqe);
}
