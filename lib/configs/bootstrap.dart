import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:logging_manager_flutter/logging_manager_flutter.dart';

import 'logging.dart';

class BootstrapApp {
  BootstrapApp({
    this.onStart,
    required this.getLoggingManager,
    this.onStarted,
    this.level = Level.ALL,
    required this.runApp,
    this.runGuarded = true,
  });

  final bool runGuarded;

  @protected
  final Level? level;

  @protected

  /// Ran before the Zone guarded execution before creation of logging mechanism
  final Future<void> Function()? onStart;
  @protected

  /// Get logging manager.
  final FlutterLoggingManager Function() getLoggingManager;

  @protected
  final Widget Function() runApp;

  @protected

  /// Ran in the Zone guarded execution after creation of logging mechanism.
  final List<Future<dynamic>> Function()? onStarted;

  Future<void> _bootstrap() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = appLoggingManager.onFlutterError;

    if (onStarted != null) {
      await Future.wait(onStarted!());
    }
  }

  Future<void> _runGuarded() async {
    await _bootstrap();
    widgets.runApp(runApp());
  }

  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();

    await onStart?.call();

    final lm = getLoggingManager();
    lm.logger.level = level;

    if (!runGuarded) {
      return _runGuarded();
    }

    lm.runFlutterInZoneGuardedWithLogging(
      _runGuarded,
    );
  }
}
