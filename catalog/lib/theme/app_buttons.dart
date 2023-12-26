import 'package:catalog/catalog.dart';
import 'package:catalog/extensions/color_extensions.dart';
import 'package:catalog/theme/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/common/helper.dart';

typedef StrokeButton = OutlinedButton;
typedef GhostButton = TextButton;

class AppButtonsStyle {
  final CustomColors customColors2;
  final CustomTextStyles customTextStyles2;
  final ColorScheme colorScheme2;

  late final ButtonStyle filledButton;
  late final ButtonStyle outlineButton;
  late final ButtonStyle textButton;
  late final ButtonStyle secondaryFilledButton;
  late final ButtonStyle secondaryOutlineButton;
  late final ButtonStyle secondaryTextButton;

  AppButtonsStyle(
    this.customColors2,
    this.customTextStyles2,
    this.colorScheme2,
  ) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    );

    filledButton = FilledButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: customTextStyles2.buttonLarge,
      elevation: 0.0,
      foregroundColor: customColors2.textColor!.shade100,
    );

    outlineButton = OutlinedButton.styleFrom(
      shape: roundedRectangleBorder,
      side: BorderSide(
        width: 2,
        color: colorScheme2.primary,
      ),
      textStyle: customTextStyles2.buttonLarge,
      elevation: 0.0,
    );

    textButton = TextButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: customTextStyles2.buttonLarge,
      elevation: 0.0,
    );

    secondaryFilledButton = filledButton.copyWith(
      backgroundColor: getMaterialStatesColors(Colors.black),
      foregroundColor: getMaterialStatesColors(
        customColors2.textColor!,
      ),
    );

    secondaryOutlineButton = outlineButton.copyWith(
      backgroundColor: getMaterialStatesColors(
        colorScheme2.surface,
      ),
      foregroundColor: getMaterialStatesColors(
        customColors2.textColor!,
      ),
      side: MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) => BorderSide(
          color: customColors2.textColor!.shade300!,
        ),
      ),
    );

    secondaryTextButton = textButton.copyWith(
      backgroundColor: getMaterialStatesColors(colorScheme2.surface),
      foregroundColor: getMaterialStatesColors(
        customColors2.textColor!,
      ),
    );
  }

  static AppButtonsStyle getButtonTheme(
    CustomColors customColors2,
    CustomTextStyles customTextStyles2,
    ColorScheme colorScheme2,
  ) =>
      AppButtonsStyle(customColors2, customTextStyles2,colorScheme2);
}
