import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/configs/logging.dart';

final loggingProvider = Provider((ref) {
  return logging;
});
