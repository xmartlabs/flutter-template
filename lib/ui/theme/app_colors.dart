import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

// Colors name extracted from https://www.color-name.com
@immutable
class AppColors extends ColorScheme {
  @override
  final Color onPrimary;
  @override
  final MaterialColor primary;
  @override
  final MaterialColor surface;

  AppColors({
    required Brightness brightness,
    required this.primary,
    required this.onPrimary,
    required Color secondary,
    required Color onSecondary,
    required Color error,
    required Color onError,
    required Color background,
    required Color onBackground,
    required this.surface,
    required Color onSurface,
  }) : super(
          brightness: brightness,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          background: background,
          onBackground: onBackground,
          surface: surface,
          onSurface: onSurface,
        );

  static AppColors getColorScheme() => AppColors(
        brightness: Brightness.light,
        primary: generateMaterialColor(color: Color(0xffee1a64)),
        onPrimary: Colors.white,
        secondary: generateMaterialColor(color: Color(0xffffd81d)),
        onSecondary: Colors.black,
        error: generateMaterialColor(color: Color(0xffF4642C)),
        onError: Colors.black,
        onBackground: Colors.black,
        surface: generateMaterialColor(color: Color(0xFFE6E9EC)),
        onSurface: Colors.black,
        background: Colors.white,
      );
}
