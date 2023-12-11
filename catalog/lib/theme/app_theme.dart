import 'package:catalog/theme/app_colors.dart';
import 'package:catalog/theme/app_dimensions.dart';
import 'package:catalog/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
//TODO: add theme extensions

late AppColors _colors;
late AppDimens _dimensions;
late AppTextStyles _styles;
late AppButtonsStyle _buttonStyles;

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    _styles = AppTextStyles.getAppStyles();
    _dimensions = AppDimens.getDimensions();
    _colors = AppColors.getColorScheme();
    _buttonStyles = AppButtonsStyle.getButtonTheme();

    return ThemeData(
      primaryColor: _colors.primary,
      colorScheme: _colors,
      useMaterial3: true,
      filledButtonTheme: FilledButtonThemeData(
        style: _buttonStyles.filledButton,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _buttonStyles.outlineButton,
      ),
      textButtonTheme: TextButtonThemeData(
        style: _buttonStyles.textButton,
      ),
      textTheme: _styles.getThemeData().apply(
            bodyColor: _colors.textColor,
            displayColor: _colors.textColor.shade500,
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: _colors.primary.shade400,
        titleTextStyle: TextStyle(color: _colors.textColor.shade100),
      ),
    );
  }
}

extension ThemeExtensions on ThemeData {
  AppDimens get dimensions => _dimensions;

  AppColors get colors => _colors;

  AppTextStyles get textStyles => _styles;

  AppButtonsStyle get buttonsStyle => _buttonStyles;
}
