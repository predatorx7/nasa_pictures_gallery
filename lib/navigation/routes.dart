import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/home/home.dart';
import '../app/launch_screen.dart';
import '../app/pictures/pictures.dart';

/// Returns value if the runtime type matches the declared [T] when calling getTypeIf.
///
/// For example, `getTypeIf<String>(value)` will only return if `value`'s type is `String`
T? getTypeIf<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

final routesProvider = Provider<List<GoRoute>>((ref) {
  return [LaunchScreen.route, HomeScreen.route, PicturesScreen.route];
});
