import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/app/home.dart';

import '../app/launch_screen.dart';

final routesProvider = Provider<List<GoRoute>>((ref) {
  return [
    LaunchScreen.route,
    HomeScreen.route,
  ];
});
