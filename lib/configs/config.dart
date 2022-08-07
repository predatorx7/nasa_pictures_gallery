import 'package:flutter/foundation.dart';

class BuildConfigurations {
  bool get isDiagnosticsEnabled => kDebugMode;

  /// Skip some timers during tests
  bool isTestMode = false;
}

final buildConfigurations = BuildConfigurations();
