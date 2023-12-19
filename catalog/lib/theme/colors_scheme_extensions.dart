// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

// Colors name extracted from https://www.color-name.com
@immutable
class ColorsSchemeExtensions extends ColorScheme {
  @override
  final Color onPrimary;
  @override
  final MaterialColor primary;
  @override
  final MaterialColor secondary;
  @override
  final MaterialColor surface;
  @override
  final MaterialColor onSurface;

  ColorsSchemeExtensions({
    required ColorScheme colorScheme,
    required this.onPrimary,
    required this.onSurface,
    required this.secondary,
    required this.primary,
    required this.surface,
  }) : super(
          brightness: colorScheme.brightness,
          primary: colorScheme.primary,
          onPrimary: colorScheme.onPrimary,
          primaryContainer: colorScheme.primaryContainer,
          onPrimaryContainer: colorScheme.onPrimaryContainer,
          secondary: colorScheme.secondary,
          onSecondary: colorScheme.onSecondary,
          secondaryContainer: colorScheme.secondaryContainer,
          onSecondaryContainer: colorScheme.onSecondaryContainer,
          tertiary: colorScheme.tertiary,
          onTertiary: colorScheme.onTertiary,
          tertiaryContainer: colorScheme.tertiaryContainer,
          onTertiaryContainer: colorScheme.onTertiaryContainer,
          error: colorScheme.error,
          onError: colorScheme.onError,
          errorContainer: colorScheme.errorContainer,
          onErrorContainer: colorScheme.onErrorContainer,
          background: colorScheme.background,
          onBackground: colorScheme.onBackground,
          surface: colorScheme.surface,
          onSurface: colorScheme.onSurface,
          surfaceVariant: colorScheme.surfaceVariant,
          onSurfaceVariant: colorScheme.onSurfaceVariant,
          outline: colorScheme.outline,
          outlineVariant: colorScheme.outlineVariant,
          shadow: colorScheme.shadow,
          scrim: colorScheme.scrim,
          inverseSurface: colorScheme.inverseSurface,
          onInverseSurface: colorScheme.onInverseSurface,
          inversePrimary: colorScheme.inversePrimary,
          surfaceTint: colorScheme.surfaceTint,
        );

  static ColorsSchemeExtensions getColorScheme() => ColorsSchemeExtensions(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const MaterialColor(
            0xffee1a64,
            <int, Color>{
              100: Color(0xfffff2f6),
              200: Color(0xfffcc7da),
              300: Color(0xfffa9ebe),
              400: Color(0xfff5558d),
              500: Color(0xffee1a64),
              600: Color(0xffe80051),
              700: Color(0xffdf004e),
              800: Color(0xffd2004a),
              900: Color(0xffc30044),
              1000: Color(0xffb3003e),
            },
          ),
          primaryContainer: const Color(0xffee1a64),
          onSecondary: Colors.black,
          error: const MaterialColor(
            0xfff4642c,
            <int, Color>{
              100: Color(0xfffeebd4),
              200: Color(0xfffbb37f),
              300: Color(0xfff4642c),
              400: Color(0xffd74824),
              500: Color(0xff750908),
            },
          ),
          onError: Colors.black,
          onBackground: const Color(0xffadadad),
          background: const Color(0xfff7fafd),
        ),
        primary: const MaterialColor(
          0xffee1a64,
          <int, Color>{
            100: Color(0xfffff2f6),
            200: Color(0xfffcc7da),
            300: Color(0xfffa9ebe),
            400: Color(0xfff5558d),
            500: Color(0xffee1a64),
            600: Color(0xffe80051),
            700: Color(0xffdf004e),
            800: Color(0xffd2004a),
            900: Color(0xffc30044),
            1000: Color(0xffb3003e),
          },
        ),
        onPrimary: const MaterialColor(
          0xff414158,
          <int, Color>{
            100: Color(0xffffffff),
            200: Color(0xffc2c2cc),
            300: Color(0xff8a8aa8),
            400: Color(0xff414158),
            500: Color(0xff1d1616),
          },
        ),
        secondary: const MaterialColor(
          0xffffd81d,
          <int, Color>{
            100: Color(0xfffff9de),
            200: Color(0xfffff5bb),
            300: Color(0xfffff098),
            400: Color(0xffffe455),
            500: Color(0xffffd81d),
            600: Color(0xfff5cb00),
            700: Color(0xffe9c100),
            800: Color(0xffd9b400),
            900: Color(0xffc6a500),
            1000: Color(0xffb39500),
          },
        ),
        surface: const MaterialColor(
          0xfff7fafd,
          <int, Color>{
            100: Color(0xffffffff),
            200: Color(0xffadadad),
            300: Color(0xff5b5b5b),
            400: Color(0xff1e1e1e),
            500: Color(0xffdce1e5),
          },
        ),
        onSurface: const MaterialColor(
          0xfff7fafd,
          <int, Color>{
            100: Color(0xffffffff),
            200: Color(0xffadadad),
            300: Color(0xff5b5b5b),
            400: Color(0xff1e1e1e),
            500: Color(0xff0f0f0f),
          },
        ),
      );
}

extension MaterialExtensions on MaterialColor {
  Color get shade1000 => this[1000]!;
}
