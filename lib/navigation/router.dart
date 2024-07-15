import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_pictures/navigation/routes.dart';


T? getTypeIf<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

final routerInitialLocationProvider = Provider<String?>((ref) {
  return null;
});

final routerProviderRef = Provider(
  (ref) {
    final List<GoRoute> routes = ref.watch(routesProvider);
    return GoRouter(
      debugLogDiagnostics: kDebugMode,
      initialLocation: ref.watch(routerInitialLocationProvider),
      routes: routes,
    );
  },
);
