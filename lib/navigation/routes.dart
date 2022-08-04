import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/home.dart';
import '../app/launch_screen.dart';
import '../app/pictures.dart';

final routesProvider = Provider<List<GoRoute>>((ref) {
  return [
    LaunchScreen.route,
    HomeScreen.route,
    PicturesScreen.route,
  ];
});
