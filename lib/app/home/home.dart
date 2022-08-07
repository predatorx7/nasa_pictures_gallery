import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gallery/items.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static final route = GoRoute(
    name: HomeScreen.routeName,
    path: HomeScreen.routeName,
    builder: (context, s) {
      return const HomeScreen();
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: const GalleryItems(),
    );
  }
}
