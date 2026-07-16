import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/storage/db.dart';
import 'package:nasa_pictures/storage/provider.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = DatabaseConstructor.userAccount();
  ref.onDispose(db.close);
  return db;
});
