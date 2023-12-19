import 'package:catalog/theme/app_text_styles.dart';
import 'package:catalog/theme/colors_scheme_extensions.dart';
import 'package:catalog/theme/text_styles_extensions.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_dimensions_extensions.dart';
import 'package:catalog/theme/colors_extensions.dart';

late ColorsExtensions _colorsExtensions;
late AppDimensExtensions _dimensions;
late ColorsSchemeExtensions _colors;
late AppTextStyles _styles;
late TextStylesExtensions _stylesExtensions;

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    _styles = AppTextStyles.getAppStyles();
    _dimensions = AppDimensExtensions.getDimensions();
    _colorsExtensions = ColorsExtensions.getColorsExtensions();
    _colors = ColorsSchemeExtensions.getColorScheme();
    _stylesExtensions = TextStylesExtensions.getAppStyles();

    return ThemeData(
      extensions: [_colorsExtensions, _stylesExtensions],
      primaryColor: _colors.primary,
      colorScheme: _colors,
      textTheme: _styles.getThemeData(),
      primaryTextTheme: _styles.getThemeData(),
    );
  }
}

extension ThemeExtensions on ThemeData {
  AppDimensExtensions get dimensions => _dimensions;

  ColorsSchemeExtensions get colors => _colors;

  AppTextStyles get textStyles => _styles;

  TextStylesExtensions get textStylesExtension => _stylesExtensions;

  ColorsExtensions get customColors => extension<ColorsExtensions>()!;
}
