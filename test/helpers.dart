import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/app/app.dart';

Widget widgetWithOverridenProviders(
  Widget child, {
  List<Override> overrides = const [],
}) {
  return ProviderScope(
    overrides: overrides,
    child: child,
  );
}

Widget appWithOverridenProviders({
  List<Override> overrides = const [],
}) {
  return widgetWithOverridenProviders(
    const MainApp(),
    overrides: overrides,
  );
}
