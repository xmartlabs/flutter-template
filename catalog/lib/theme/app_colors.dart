// ignore_for_file: overridden_fields

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

  const AppColors({
    required super.brightness,
    required this.primary,
    required this.onPrimary,
    required super.secondary,
    required super.onSecondary,
    required super.error,
    required super.onError,
    required super.background,
    required super.onBackground,
    required this.surface,
    required super.onSurface,
  }) : super(
          primary: primary,
          onPrimary: onPrimary,
          surface: surface,
        );

  static AppColors getColorScheme() => AppColors(
        brightness: Brightness.light,
        primary: generateMaterialColor(color: const Color(0xffee1a64)),
        onPrimary: Colors.white,
        secondary: generateMaterialColor(color: const Color(0xffffd81d)),
        onSecondary: Colors.black,
        error: generateMaterialColor(color: const Color(0xffF4642C)),
        onError: Colors.black,
        onBackground: Colors.black,
        surface: generateMaterialColor(color: const Color(0xFFE6E9EC)),
        onSurface: Colors.black,
        background: Colors.white,
      );
}
