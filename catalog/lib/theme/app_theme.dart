import 'package:catalog/theme/app_text_styles.dart';
import 'package:catalog/theme/app_color_scheme.dart';
import 'package:catalog/theme/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_dimensions.dart';
import 'package:catalog/theme/custom_colors.dart';

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
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }
}

extension ThemeExtensions on ThemeData {
  AppColorScheme get colors => AppColorScheme.getDefaultColorScheme();

  CustomColors get customColors => extension<CustomColors>()!;

  AppDimension get dimensions => extension<AppDimension>()!;

  CustomTextStyles get customTextStyles => extension<CustomTextStyles>()!;

  TextTheme get textStyles => AppTextStyles.getDefaultAppStyles().getThemeData();
}
