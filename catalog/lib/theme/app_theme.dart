import 'package:catalog/theme/app_text_styles.dart';
import 'package:catalog/theme/app_color_scheme.dart';
import 'package:catalog/theme/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_dimensions.dart';
import 'package:catalog/theme/custom_colors.dart';
import 'package:catalog/theme/app_buttons.dart';

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    final textTheme = AppTextStyles.getDefaultAppStyles().getThemeData();
    final colors = AppColorScheme.getDefaultColorScheme();

    return ThemeData(
      extensions: [
        CustomColors.getCustomColors(),
        CustomTextStyles.getCustomTextStyles(),
        AppDimension.getDefaultDimensions(),
      ],
      primaryColor: colors.primary,
      colorScheme: colors,
      filledButtonTheme: FilledButtonThemeData(
        style: AppButtonsStyle.getButtonTheme().filledButton,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: AppButtonsStyle.getButtonTheme().outlineButton,
      ),
      textButtonTheme: TextButtonThemeData(
        style: AppButtonsStyle.getButtonTheme().textButton,
      ),
      textTheme: textTheme.apply(
        bodyColor: CustomColors.getCustomColors().textColor,
        displayColor: CustomColors.getCustomColors().textColor!.getShade(500),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary.shade400,
        titleTextStyle: TextStyle(
          color: CustomColors.getCustomColors().textColor!.getShade(500),
        ),
      ),
      primaryTextTheme: textTheme,
    );
  }
}

extension ThemeExtensions on ThemeData {
  AppColorScheme get colors => AppColorScheme.getDefaultColorScheme();

  CustomColors get customColors => extension<CustomColors>()!;

  AppDimension get dimensions => extension<AppDimension>()!;

  CustomTextStyles get customTextStyles => extension<CustomTextStyles>()!;

  TextTheme get textStyles =>
      AppTextStyles.getDefaultAppStyles().getThemeData();

  AppButtonsStyle get buttonsStyle => AppButtonsStyle.getButtonTheme();
}
