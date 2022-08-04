import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStyles {
  AppStyles._();

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    tertiary: Colors.amber,
  );

  static ThemeData theme = ThemeData(
    colorScheme: colorScheme,
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      centerTitle: true,
      elevation: 0,
    ),
    primaryColor: colorScheme.primary,
    useMaterial3: true,
    splashFactory: kIsWeb ? null : InkSparkle.splashFactory,
  );
}
