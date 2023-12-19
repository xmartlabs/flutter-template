import 'package:catalog/catalog.dart';
import 'package:catalog/theme/app_color_scheme.dart';
import 'package:catalog/theme/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    final textTheme = AppTextStyles.getDefaultAppStyles().getThemeData();
    final colors = AppColorScheme.getDefaultColorScheme();
    final customColors = CustomColors.getCustomColors();
    final customTextStyles = CustomTextStyles.getCustomTextStyles();
    final appDimension = AppDimension.getDefaultDimensions();

    return ThemeData(
      extensions: [customColors, customTextStyles, appDimension],
      primaryColor: colors.primary,
      colorScheme: colors,
      dialogTheme: DialogTheme(
        backgroundColor: colors.surface.shade100,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: colors.surface.shade500),
        ),
        titleTextStyle: customTextStyles.customOverline
            .copyWith(color: customColors.textColor!.getShade(300))
            .semibold(),
        contentTextStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(400)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(400)),
        filled: true,
        helperStyle: textTheme.bodySmall
            ?.copyWith(color: customColors.textColor!.getShade(300)!),
        hintStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(300)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(100)!,
          ),
        ),
        fillColor: colors.surface.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(200)!,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.danger!.getShade(300)!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: colors.primary.shade800,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(200)!,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: colors.error,
          ),
        ),
        errorStyle: textTheme.labelSmall?.copyWith(color: customColors.danger),
        errorMaxLines: 2,
        hoverColor: colors.primary.shade400,
        focusColor: colors.primary.shade800,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: textTheme.bodyMedium?.copyWith(
          color: colors.primary.shade500,
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
              color: colors.onSurface.shade200,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
          ),
        ),
      ),
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
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => colors.primary.shade600,
        ),
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => customColors.textColor!.getShade(100),
        ),
        side: BorderSide(
          width: 2,
          color: customColors.textColor!.getShade(400)!,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => customColors.textColor!.getShade(400),
        ),
      ),
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
