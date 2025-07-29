import 'package:design_system/common/helper.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/extensions/color_extensions.dart';
import 'package:design_system/theme/app_buttons.dart';
import 'package:design_system/theme/app_color_scheme.dart';
import 'package:design_system/theme/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData provideAppTheme(BuildContext buildContext) {
    // It can be changed based on the device
    final textTheme = AppTextStyles.getDefaultAppStyles().getThemeData();
    final colors = AppColorScheme.getDefaultColorScheme();
    final customColors = CustomColors.getCustomColors();
    final customTextStyles = CustomTextStyles.getCustomTextStyles(customColors);
    final appDimension = AppDimension.getDefaultDimensions();
    final buttonTheme = AppButtonsStyle.getDefaultButtonTheme(
      customColors,
      customTextStyles,
      colors,
    );

    return ThemeData(
      extensions: [customColors, customTextStyles, appDimension, buttonTheme],
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
      ).data,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(400)),
        filled: true,
        helperStyle: textTheme.bodySmall
            ?.copyWith(color: customColors.textColor!..getShade(300)),
        hintStyle: textTheme.bodyMedium
            ?.copyWith(color: customColors.textColor!.getShade(300)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(100),
          ),
        ),
        fillColor: colors.surface.shade100,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.textColor!.getShade(200),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: customColors.danger!.getShade(300),
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
            color: customColors.textColor!.getShade(200),
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
          maximumSize: WidgetStateProperty.resolveWith<Size?>(
            (Set<WidgetState> states) => Size(1.sw, 35.h * 6),
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
        style: buttonTheme.filledButton,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonTheme.outlineButton,
      ),
      textButtonTheme: TextButtonThemeData(
        style: buttonTheme.textButton,
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
        checkColor: getMaterialStatesColors(colors.primary.shade600),
        fillColor:
            getMaterialStatesColors(customColors.textColor!..getShade(100)),
        side: BorderSide(
          width: 2,
          color: customColors.textColor!.getShade(400),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor:
            getMaterialStatesColors(customColors.textColor!.getShade(400)),
      ),
    );
  }
}

extension ThemeExtensions on ThemeData {
  CustomColors get customColors => extension<CustomColors>()!;

  AppDimension get dimensions => extension<AppDimension>()!;

  CustomTextStyles get customTextStyles => extension<CustomTextStyles>()!;

  TextTheme get textStyles => primaryTextTheme;

  AppButtonsStyle get buttonsStyle => extension<AppButtonsStyle>()!;
}
