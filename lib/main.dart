import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'configs/logging.dart';

void main() {
  setupLogging();

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}
