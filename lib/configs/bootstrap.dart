import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:logging_manager_flutter/logging_manager_flutter.dart';

class BootstrapApp {
  BootstrapApp({
    this.onStart,
    required this.loggingManager,
    this.onStarted,
    this.level = Level.ALL,
    required this.runApp,
    this.runGuarded = true,
  });

  final bool runGuarded;

  /// Override the level for this particular [Logger] and its children.
  /// Setting this to null makes it inherit the [parent]s level.
  @protected
  final Level? level;

  @protected

  /// Ran before the Zone guarded execution before creation of logging mechanism
  final Future<void> Function()? onStart;
  @protected

  /// Get logging manager.
  final FlutterLoggingManager loggingManager;

  @protected
  final Widget Function() runApp;

  @protected

  /// Ran in the Zone guarded execution after creation of logging mechanism.
  final List<Future<dynamic>> Function()? onStarted;

  Future<void> _bootstrap() async {
    /// This is required in a new zone before using plugins.
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = loggingManager.onFlutterError;

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

    loggingManager.logger.level = level;

    if (!runGuarded) {
      return _runGuarded();
    }

    loggingManager.runFlutterInZoneGuardedWithLogging(
      _runGuarded,
    );
  }
}
