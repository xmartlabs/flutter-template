import 'package:catalog/catalog.dart';
import 'package:catalog/extensions/color_extensions.dart';
import 'package:catalog/theme/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/common/helper.dart';

typedef StrokeButton = OutlinedButton;
typedef GhostButton = TextButton;

class AppButtonsStyle extends ThemeExtension<AppButtonsStyle> {
  final CustomColors customColors;
  final CustomTextStyles customTextStyles;
  final ColorScheme colorScheme;

  late final ButtonStyle filledButton;
  late final ButtonStyle outlineButton;
  late final ButtonStyle textButton;
  late final ButtonStyle secondaryFilledButton;
  late final ButtonStyle secondaryOutlineButton;
  late final ButtonStyle secondaryTextButton;

  AppButtonsStyle(
    this.customColors,
    this.customTextStyles,
    this.colorScheme,
  ) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    );

    filledButton = FilledButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: customTextStyles.buttonLarge,
      elevation: 0.0,
      foregroundColor: customColors.textColor!.shade100,
    );

    outlineButton = OutlinedButton.styleFrom(
      shape: roundedRectangleBorder,
      side: BorderSide(
        width: 2,
        color: colorScheme.primary,
      ),
      textStyle: customTextStyles.buttonLarge,
      elevation: 0.0,
    );

    textButton = TextButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: customTextStyles.buttonLarge,
      elevation: 0.0,
    );

    secondaryFilledButton = filledButton.copyWith(
      backgroundColor:
          getMaterialStatesColors(customColors.textColor!.shade300!),
      foregroundColor: getMaterialStatesColors(
        customColors.textColor!.shade100!,
      ),
    );

    secondaryOutlineButton = outlineButton.copyWith(
      backgroundColor: getMaterialStatesColors(
        colorScheme.surface.shade100!,
      ),
      foregroundColor: getMaterialStatesColors(
        customColors.textColor!.shade300!,
      ),
      side: MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) => BorderSide(
          color: customColors.textColor!.shade300!,
        ),
      ),
    );

    secondaryTextButton = textButton.copyWith(
      backgroundColor: getMaterialStatesColors(
        Colors.transparent,
      ),
      foregroundColor: getMaterialStatesColors(
        customColors.textColor!.shade300!,
      ),
    );
  }

  static AppButtonsStyle getDefaultButtonTheme(
    CustomColors customColors,
    CustomTextStyles customTextStyles,
    ColorScheme colorScheme,
  ) =>
      AppButtonsStyle(customColors, customTextStyles, colorScheme);

  @override
  AppButtonsStyle copyWith() => AppButtonsStyle.getDefaultButtonTheme(
        customColors,
        customTextStyles,
        colorScheme,
      );

  @override
  AppButtonsStyle lerp(AppButtonsStyle other, double t) {
    if (other is! CustomTextStyles) {
      return this;
    }
    return AppButtonsStyle(
      customColors,
      customTextStyles,
      colorScheme,
    );
  }
}
