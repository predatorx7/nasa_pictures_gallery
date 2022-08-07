import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'configs/bootstrap.dart';
import 'configs/logging.dart';

void main() {
  final bootstrap = BootstrapApp(
    loggingManager: appLoggingManager,
    runApp: () {
      return const ProviderScope(
        child: MainApp(),
      );
    },
  );

  bootstrap.start();
}
