import 'package:flutter/material.dart';
import 'package:jioyathri/core/util/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 18),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.black),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.blue,
      selectionColor: Colors.blue.withAlpha(24),
      selectionHandleColor: Colors.blue.withAlpha(128),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.white,
      secondary: AppColors.lightGrey,
      surface: AppColors.white,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.black,
      tertiary: AppColors.accentColor,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      color: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      titleTextStyle: const TextStyle(color: AppColors.white, fontSize: 18),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.blue,
      selectionColor: Colors.blue.withAlpha(24),
      selectionHandleColor: Colors.blue.withAlpha(128),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.black,
      secondary: Colors.grey.shade700,
      surface: AppColors.black,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
      tertiary: AppColors.accentColor,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
    ),
  );
}
