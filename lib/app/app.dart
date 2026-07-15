import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_pictures/navigation/routes.dart';

import '../../../l10n/l10n.dart';
import '../../commons/theme.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeControllerProvider);

    Widget app = MaterialApp.router(
      routerConfig: GoRouter(
        debugLogDiagnostics: kDebugMode,
        routes: ref.watch(routesProvider),
      ),
      locale: locale,
      title: 'NASA Pictures',
      theme: AppStyles.theme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      scrollBehavior: const CupertinoScrollBehavior(),
    );

    return app;
  }
}
