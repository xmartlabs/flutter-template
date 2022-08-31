import 'package:flutter/material.dart';
import 'package:flutter_template/ui/theme/app_colors.dart';
import 'package:flutter_template/ui/theme/dimensions.dart';
import 'package:flutter_template/ui/theme/text_styles.dart';

late AppColors _colors;
late AppDimens _dimensions;
late AppStyles _styles;

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    _styles = AppStyles.getAppStyles();
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

  AppStyles get textStyles => _styles;
}
