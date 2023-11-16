// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

// Colors name extracted from https://www.color-name.com
@immutable
class AppColors extends ColorScheme {
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

  final MaterialColor textColor;
  final MaterialColor info;
  final MaterialColor success;
  final MaterialColor warning;
  final MaterialColor danger;

  AppColors({
    required ColorScheme colorScheme,
    required this.textColor,
    required this.info,
    required this.success,
    required this.warning,
    required this.danger,
  })  : primary = colorScheme.primary as MaterialColor,
        secondary = colorScheme.secondary as MaterialColor,
        surface = colorScheme.surface as MaterialColor,
        onSurface = colorScheme.onSurface as MaterialColor,
        onPrimary = colorScheme.onPrimary as MaterialColor,
        super(
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

  static AppColors getColorScheme() => AppColors(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const MaterialColor(
            0xffEE1A64,
            <int, Color>{
              100: Color.fromRGBO(255, 242, 246, 1),
              200: Color.fromRGBO(252, 199, 218, 1),
              300: Color.fromRGBO(250, 158, 190, 1),
              400: Color.fromRGBO(245, 85, 141, 1),
              500: Color.fromRGBO(255, 0, 98, 1),
              600: Color.fromRGBO(232, 0, 81, 1),
              700: Color.fromRGBO(218, 0, 82, 1),
              800: Color.fromRGBO(210, 0, 74, 1),
              900: Color.fromRGBO(195, 0, 68, 1),
              1000: Color.fromRGBO(179, 0, 62, 1),
            },
          ),
          primary: const MaterialColor(
            0xffEE1A64,
            <int, Color>{
              100: Color.fromRGBO(255, 242, 246, 1),
              200: Color.fromRGBO(252, 199, 218, 1),
              300: Color.fromRGBO(250, 158, 190, 1),
              400: Color.fromRGBO(245, 85, 141, 1),
              500: Color.fromRGBO(255, 0, 98, 1),
              600: Color.fromRGBO(232, 0, 81, 1),
              700: Color.fromRGBO(218, 0, 82, 1),
              800: Color.fromRGBO(210, 0, 74, 1),
              900: Color.fromRGBO(195, 0, 68, 1),
              1000: Color.fromRGBO(179, 0, 62, 1),
            },
          ),
          primaryContainer: const Color.fromRGBO(255, 0, 98, 1),
          onPrimary: const MaterialColor(
            0xff8A8AA8,
            <int, Color>{
              200: Color.fromRGBO(194, 194, 204, 1),
              300: Color.fromRGBO(138, 138, 168, 1),
              400: Color.fromRGBO(65, 65, 88, 1),
              500: Color.fromRGBO(29, 22, 22, 1),
            },
          ),
          secondary: const MaterialColor(
            0xffFFD81D,
            <int, Color>{
              100: Color.fromRGBO(255, 249, 222, 1),
              200: Color.fromRGBO(255, 245, 187, 1),
              300: Color.fromRGBO(255, 240, 152, 1),
              400: Color.fromRGBO(255, 228, 85, 1),
              500: Color.fromRGBO(255, 216, 29, 1),
              600: Color.fromRGBO(245, 203, 0, 1),
              700: Color.fromRGBO(233, 193, 0, 1),
              800: Color.fromRGBO(217, 180, 0, 1),
              900: Color.fromRGBO(198, 165, 0, 1),
              1000: Color.fromRGBO(179, 149, 0, 1),
            },
          ),
          onSecondary: Colors.black,
          error: const MaterialColor(
            0xffF4642C,
            <int, Color>{
              100: Color.fromRGBO(254, 235, 212, 1),
              200: Color.fromRGBO(251, 179, 127, 1),
              300: Color.fromRGBO(244, 100, 44, 1),
              400: Color.fromRGBO(246, 82, 54, 1),
              500: Color.fromRGBO(163, 36, 14, 1),
            },
          ),
          onError: Colors.black,
          onBackground: const Color.fromRGBO(168, 175, 182, 1),
          surface: const MaterialColor(
            0xffF7FAFD,
            <int, Color>{
              100: Color.fromRGBO(255, 255, 255, 1),
              200: Color.fromRGBO(250, 252, 253, 1),
              300: Color.fromRGBO(245, 247, 250, 1),
              400: Color.fromRGBO(234, 239, 244, 1),
              500: Color.fromRGBO(220, 225, 229, 1),
            },
          ),
          onSurface: const MaterialColor(
            0xffF7FAFD,
            <int, Color>{
              100: Color.fromRGBO(204, 204, 204, 1),
              200: Color.fromRGBO(153, 153, 153, 1),
              300: Color.fromRGBO(127, 127, 127, 1),
              400: Color.fromRGBO(76, 76, 76, 1),
              500: Color.fromRGBO(25, 25, 25, 1),
            },
          ),
          background: const Color.fromRGBO(29, 22, 22, 1),
        ),
        textColor: const MaterialColor(
          0xff1D1616,
          <int, Color>{
            100: Color.fromRGBO(255, 255, 255, 1),
            200: Color.fromRGBO(194, 194, 204, 1),
            300: Color.fromRGBO(138, 138, 168, 1),
            400: Color.fromRGBO(65, 65, 88, 1),
            500: Color.fromRGBO(29, 22, 22, 1),
          },
        ),
        info: const MaterialColor(
          0xff1169F7,
          <int, Color>{
            100: Color.fromRGBO(207, 232, 254, 1),
            200: Color.fromRGBO(111, 176, 252, 1),
            300: Color.fromRGBO(17, 105, 247, 1),
            400: Color.fromRGBO(8, 60, 177, 1),
            500: Color.fromRGBO(3, 29, 118, 1),
          },
        ),
        success: const MaterialColor(
          0xff8EC144,
          <int, Color>{
            100: Color.fromRGBO(234, 244, 221, 1),
            200: Color.fromRGBO(198, 223, 161, 1),
            300: Color.fromRGBO(126, 172, 57, 1),
            400: Color.fromRGBO(93, 127, 42, 1),
            500: Color.fromRGBO(67, 92, 31, 1),
          },
        ),
        warning: const MaterialColor(
          0xffFFBF00,
          <int, Color>{
            100: Color.fromRGBO(255, 242, 204, 1),
            200: Color.fromRGBO(255, 220, 115, 1),
            300: Color.fromRGBO(255, 191, 0, 1),
            400: Color.fromRGBO(229, 178, 23, 1),
            500: Color.fromRGBO(153, 119, 15, 1),
          },
        ),
        danger: const MaterialColor(
          0xffF4642C,
          <int, Color>{
            100: Color.fromRGBO(254, 235, 212, 1),
            200: Color.fromRGBO(251, 179, 127, 1),
            300: Color.fromRGBO(244, 100, 44, 1),
            400: Color.fromRGBO(175, 44, 22, 1),
            500: Color.fromRGBO(117, 9, 8, 1),
          },
        ),
      );
}

extension MaterialExtensions on MaterialColor {
  Color get shade1000 => this[1000]!;
}
