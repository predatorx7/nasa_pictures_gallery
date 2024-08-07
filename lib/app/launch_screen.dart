import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_pictures/app/widgets/splash.dart';

import '../navigation/router.dart';
import 'home/home.dart';

class LaunchScreen extends ConsumerStatefulWidget {
  final String redirect;

  const LaunchScreen({
    super.key,
    required this.redirect,
  });

  static const String routeName = '/';

  static final route = GoRoute(
    name: LaunchScreen.routeName,
    path: LaunchScreen.routeName,
    builder: (context, s) {
      final redirectPath = getTypeIf<String>(s.uri.queryParameters['redirect']);

      return LaunchScreen(
        redirect: redirectPath ?? HomeScreen.routeName,
      );
    },
  );

  @override
  ConsumerState<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends ConsumerState<LaunchScreen> {
  Timer? _timer;

  void _start() {
    _timer?.cancel();
    _timer = Timer(
      durationOfSplashWithoutAnimations,
      () => _navigateToRedirect(),
    );
  }

  /// Change page only when both splash animation and dependencies are completed.
  ///
  /// -- No deps right now
  void _navigateToRedirect() {
    context.go(widget.redirect);
  }

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void didUpdateWidget(covariant LaunchScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.redirect != widget.redirect) _start();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: splashWithoutAnimationUI,
    );
  }
}
