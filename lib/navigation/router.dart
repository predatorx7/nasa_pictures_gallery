import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_pictures/navigation/routes.dart';

import '../configs/config.dart';

T? getTypeIf<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

final routerProviderRef = Provider(
  (ref) {
    final List<GoRoute> routes = ref.watch(routesProvider);
    return GoRouter(
      debugLogDiagnostics: buildConfigurations.isDiagnosticsEnabled,
      routes: routes,
    );
  },
);
