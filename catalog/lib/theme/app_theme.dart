import 'package:catalog/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_dimensions.dart';
import 'package:catalog/theme/colors_extensions.dart';

late ColorsExtensions _colorsExtensions;
late AppDimens _dimensions;
late ColorScheme _colors;
late AppTextStyles _styles;

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    _styles = AppTextStyles.getAppStyles();
    _dimensions = AppDimens.getDimensions();
    _colorsExtensions = ColorsExtensions.getColorsExtensions();
    _colors = _getColorScheme();

    return ThemeData(
      extensions: [
        _colorsExtensions,
      ],
      primaryColor: _colors.primary,
      colorScheme: _colors,
      textTheme: _styles.getThemeData(),
      primaryTextTheme: _styles.getThemeData(),
    );
  }

  static ColorScheme _getColorScheme() => ColorScheme.fromSeed(
        brightness: Brightness.dark,
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

extension ThemeExtensions on ThemeData {
  AppDimens get dimensions => _dimensions;

  ColorScheme get colors => _colors;

  AppTextStyles get textStyles => _styles;

  ColorsExtensions get customColors => extension<ColorsExtensions>()!;
}
