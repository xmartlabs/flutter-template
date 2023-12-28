import 'package:catalog/catalog.dart';
import 'package:catalog/extensions/color_extensions.dart';
import 'package:catalog/theme/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/common/helper.dart';

typedef StrokeButton = OutlinedButton;
typedef GhostButton = TextButton;

class AppButtonsStyle extends ThemeExtension<AppButtonsStyle> {
  final CustomColors _customColors;
  final CustomTextStyles _customTextStyles;
  final ColorScheme _colorScheme;

  late final ButtonStyle filledButton;
  late final ButtonStyle outlineButton;
  late final ButtonStyle textButton;
  late final ButtonStyle secondaryFilledButton;
  late final ButtonStyle secondaryOutlineButton;
  late final ButtonStyle secondaryTextButton;

  AppButtonsStyle(
    this._customColors,
    this._customTextStyles,
    this._colorScheme,
  ) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    );

    filledButton = FilledButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: _customTextStyles.buttonLarge,
      elevation: 0.0,
      foregroundColor: _customColors.textColor!.shade100,
    );

    outlineButton = OutlinedButton.styleFrom(
      shape: roundedRectangleBorder,
      side: BorderSide(
        width: 2,
        color: _colorScheme.primary,
      ),
      textStyle: _customTextStyles.buttonLarge,
      elevation: 0.0,
    );

    textButton = TextButton.styleFrom(
      shape: roundedRectangleBorder,
      textStyle: _customTextStyles.buttonLarge,
      elevation: 0.0,
    );

    secondaryFilledButton = filledButton.copyWith(
      backgroundColor:
          getMaterialStatesColors(_customColors.textColor!.shade300!),
      foregroundColor: getMaterialStatesColors(
        _customColors.textColor!.shade100!,
      ),
    );

    secondaryOutlineButton = outlineButton.copyWith(
      backgroundColor: getMaterialStatesColors(
        _colorScheme.surface.shade100!,
      ),
      foregroundColor: getMaterialStatesColors(
        _customColors.textColor!.shade300!,
      ),
      side: MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) => BorderSide(
          color: _customColors.textColor!.shade300!,
        ),
      ),
    );

    secondaryTextButton = textButton.copyWith(
      backgroundColor: getMaterialStatesColors(
        Colors.transparent,
      ),
      foregroundColor: getMaterialStatesColors(
        _customColors.textColor!.shade300!,
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
        _customColors,
        _customTextStyles,
        _colorScheme,
      );

  @override
  AppButtonsStyle lerp(AppButtonsStyle other, double t) {
    if (other is! CustomTextStyles) {
      return this;
    }
    return AppButtonsStyle(
      _customColors,
      _customTextStyles,
      _colorScheme,
    );
  }
}
