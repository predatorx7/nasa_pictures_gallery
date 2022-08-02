import 'package:logging_manager/logging.dart';
import 'package:logging_manager_flutter/logging_manager_flutter.dart';

const String appLoggerName = 'nasa_gallery';

final Logging logging = Logging(appLoggerName);

final appLoggingManager = FlutterLoggingManager(
  logger: logging.logger,
  tree: LoggingTree.coloredPrinting(),
);
