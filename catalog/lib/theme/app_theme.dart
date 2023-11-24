import 'package:catalog/theme/app_buttons.dart';
import 'package:catalog/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_colors.dart';
import 'package:catalog/theme/app_dimensions.dart';
//TODO: add theme extensions

late AppColors _colors;
late AppDimens _dimensions;
late AppTextStyles _styles;
late AppButtons _buttons;

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    _styles = AppTextStyles.getAppStyles();
    _dimensions = AppDimens.getDimensions();
    _colors = AppColors.getColorScheme();
    _buttons = AppButtons.getButtonTheme();

    return ThemeData(
      primaryColor: _colors.primary,
      colorScheme: _colors,
      filledButtonTheme: FilledButtonThemeData(
        style: _buttons.filledButton,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _buttons.outlineButton,
      ),
      textButtonTheme: TextButtonThemeData(
        style: _buttons.textButton,
      ),
      scaffoldBackgroundColor: _colors.primary.shade200,
      textTheme: _styles.getThemeData().apply(
        bodyColor: _colors.textColor.shade100,
        displayColor: _colors.textColor.shade500,
      ),
      primaryTextTheme: _styles.getThemeData().apply(
        bodyColor: _colors.textColor.shade100,
        displayColor: _colors.primary,
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

  AppButtons get buttons => _buttons;
}
