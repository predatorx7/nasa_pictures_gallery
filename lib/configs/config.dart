import 'package:flutter/foundation.dart';

class BuildConfigurations {
  bool get isDiagnosticsEnabled => kDebugMode;
}

final buildConfigurations = BuildConfigurations();
