import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

const String appLoggerName = 'nasa_gallery';

final Logger logging = Logger(appLoggerName);

extension LoggerExtension on Logger {
  /// Create a new child [Logging] instance with a [name].
  ///
  /// The full name of this new Logging will be this logging's full name + the [name].
  Logger call(String name) {
    return Logger('$fullName.$name');
  }
}


final _logDateFormat = DateFormat('hh:mm:ss aa');

void _onLogsToConsole(LogRecord record) {
  final formattedTime = _logDateFormat.format(record.time);

  final label =
      '$formattedTime ${record.level.name} ${record.loggerName} (${record.sequenceNumber})';

  final message = record.message;
  debugPrintThrottled('$label $message'.trim());
  final error = record.error;
  if (error != null) debugPrintThrottled('$label [Error] $error');
  if (record.level >= Level.WARNING) {
    debugPrintStack(
      stackTrace: record.stackTrace,
      label: label,
      maxFrames: 20,
    );
  }
}

void setupLogging([Level? level]) {
  hierarchicalLoggingEnabled = true;
  final rootLogger = Logger('');
  rootLogger.level = level ?? (kReleaseMode ? Level.SEVERE : Level.ALL);
  rootLogger.onRecord.listen(_onLogsToConsole);

  final flutterErrorLogger = logging('FlutterError');
  // Pass all uncaught "fatal" errors from the framework to logging
  FlutterError.onError = (details) {
    flutterErrorLogger.severe(
      details,
      details.exception,
      details.stack,
    );
  };

  final platformDispatcherLogger = logging('PlatformDispatcher');
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to logging
  PlatformDispatcher.instance.onError = (error, stack) {
    platformDispatcherLogger.severe(
      'Uncaught asynchronous error',
      error,
      stack,
    );
    return true;
  };
}
