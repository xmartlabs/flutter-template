import 'package:catalog/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_colors.dart';
import 'package:catalog/theme/app_dimensions.dart';

late AppColors _colors;
late AppDimens _dimensions;
late AppTextStyles _styles;

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    _styles = AppTextStyles.getAppStyles();
    _dimensions = AppDimens.getDimensions();
    _colors = AppColors.getColorScheme();

    return ThemeData(
      primaryColor: _colors.primary,
      colorScheme: _colors,
      textTheme: _styles.getThemeData(),
      primaryTextTheme: _styles.getThemeData(),
    );
  }
}

extension ThemeExtensions on ThemeData {
  AppDimens get dimensions => _dimensions;

  AppColors get colors => _colors;

  AppTextStyles get textStyles => _styles;
}
