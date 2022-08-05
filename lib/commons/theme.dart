import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
    typography: typography,
  );

  static TextTheme textTheme = GoogleFonts.openSansTextTheme(
    Typography.englishLike2021,
  );

  static Typography typography = Typography.material2021(
    black: textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
      decorationColor: Colors.black,
    ),
    white: textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
      decorationColor: Colors.white,
    ),
  );
}
