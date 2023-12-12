import 'package:catalog/theme/app_buttons.dart';
import 'package:catalog/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_colors.dart';
import 'package:catalog/theme/app_dimensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      dialogTheme: DialogTheme(
        backgroundColor: _colors.surface.shade100,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: _colors.surface.shade500),
        ),
        titleTextStyle: _styles.customOverline
            .copyWith(color: _colors.textColor.shade300)
            .semibold(),
        contentTextStyle:
            _styles.bodyMedium?.copyWith(color: _colors.textColor.shade400),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle:
            _styles.bodyMedium?.copyWith(color: _colors.textColor.shade400),
        filled: true,
        helperStyle:
            _styles.bodySmall?.copyWith(color: _colors.textColor.shade300),
        hintStyle:
            _styles.bodyMedium?.copyWith(color: _colors.textColor.shade300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: _colors.textColor.shade100,
          ),
        ),
        fillColor: _colors.surface.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: _colors.textColor.shade200,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: _colors.danger.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: _colors.primary.shade800,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: _colors.textColor.shade200,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: _colors.error,
          ),
        ),
        errorStyle: _styles.labelSmall?.copyWith(color: _colors.danger),
        errorMaxLines: 2,
        hoverColor: _colors.primary.shade400,
        focusColor: _colors.primary.shade800,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: _styles.bodyMedium?.copyWith(
          color: _colors.primary.shade500,
        ),
        menuStyle: MenuStyle(
          maximumSize: MaterialStateProperty.resolveWith<Size?>(
            (Set<MaterialState> states) => Size(1.sw, 35.h * 6),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _colors.onSurface.shade200,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
          ),
        ),
      ),
      primaryColor: _colors.primary,
      colorScheme: _colors,
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
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) =>
              AppColors.getColorScheme().primary.shade600,
        ),
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) =>
              AppColors.getColorScheme().textColor.shade100,
        ),
        side: BorderSide(
          width: 2,
          color: AppColors.getColorScheme().textColor.shade400,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) =>
              AppColors.getColorScheme().textColor.shade400,
        ),
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
