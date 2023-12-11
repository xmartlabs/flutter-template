import 'package:catalog/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_colors.dart';
import 'package:catalog/theme/app_dimensions.dart';
//TODO: add theme extensions

late ColorsExtensions _colors;
late AppDimens _dimensions;
late AppTextStyles _styles;

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    _styles = AppTextStyles.getAppStyles();
    _dimensions = AppDimens.getDimensions();
    _colors = const ColorsExtensions();

    return ThemeData(
      extensions: [
        _colors,
      ],
      primaryColor: _colors.primary,
      colorScheme: _colors,
      textTheme: _styles.getThemeData(),
      primaryTextTheme: _styles.getThemeData(),
    );
  }
}

@immutable
class ColorsExtensions extends ThemeExtension<ColorsExtensions> {
  const ColorsExtensions();

  @override
  ColorsExtensions copyWith() => const ColorsExtensions();

  @override
  ColorsExtensions lerp(ColorsExtensions? other, double t) {
    if (other is! ColorsExtensions) {
      return this;
    }
    return const ColorsExtensions();
  }
}