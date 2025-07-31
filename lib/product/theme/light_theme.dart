import 'package:flutter/material.dart';
import 'package:shartflix/product/theme/custom_color_scheme.dart';
import 'package:shartflix/product/theme/custom_theme.dart';

final class CustomColorTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    fontFamily: 'Euclid Circular A Bold',
    colorScheme: CustomColorScheme.colorScheme,
    floatingActionButtonTheme: floatingActionButtonThemeData,
    textTheme: textThemeData,
  );

  ThemeData get themeDataSecond => ThemeData(
    useMaterial3: true,
    fontFamily: 'Euclid Circular A Regular',
    colorScheme: CustomColorScheme.colorScheme,
    floatingActionButtonTheme: floatingActionButtonThemeData,
    textTheme: textThemeData,
  );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  final TextTheme textThemeData = TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      color: CustomColorScheme.colorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: CustomColorScheme.colorScheme.onSurface,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: CustomColorScheme.colorScheme.onSurface,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: CustomColorScheme.colorScheme.onSurface,
      fontWeight: FontWeight.normal,
    ),
  );
}
