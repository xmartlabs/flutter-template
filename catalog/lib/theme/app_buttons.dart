import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/theme/app_color_scheme.dart';
import 'package:catalog/theme/custom_colors.dart';
import 'package:catalog/theme/custom_text_styles.dart';

typedef StrokeButton = OutlinedButton;
typedef GhostButton = TextButton;

class AppButtonsStyle {
  final ButtonStyle filledButton = _appFilledButton;
  final ButtonStyle outlineButton = _appOutlineButton;
  final ButtonStyle textButton = _appTextButton;
  final ButtonStyle secondaryFilledButton = _appSecondaryFilledButton;
  final ButtonStyle secondaryOutlineButton = _appSecondaryOutlineButton;
  final ButtonStyle secondaryTextButton = _appSecondaryTextButton;

  AppButtonsStyle();

  static AppButtonsStyle getButtonTheme() => AppButtonsStyle();
}

final _appFilledButton = FilledButton.styleFrom(
  minimumSize: Size(double.infinity, 50.h),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  ),
  textStyle: CustomTextStyles.getCustomTextStyles().buttonLarge,
  elevation: 0.0,
  foregroundColor: CustomColors.getCustomColors().textColor!.getShade(100),
);

final _appOutlineButton = OutlinedButton.styleFrom(
  minimumSize: Size(double.infinity, 50.h),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  ),
  side: BorderSide(
    width: 2,
    color: AppColorScheme.getDefaultColorScheme().primary,
  ),
  textStyle: CustomTextStyles.getCustomTextStyles().buttonLarge,
  elevation: 0.0,
);

final _appTextButton = TextButton.styleFrom(
  minimumSize: Size(double.infinity, 50.h),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
  textStyle: CustomTextStyles.getCustomTextStyles().buttonLarge,
  elevation: 0.0,
);

final _appSecondaryFilledButton = _appFilledButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return CustomColors.getCustomColors().textColor!.getShade(500);
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade500;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColorScheme.getDefaultColorScheme().onSurface.shade400;
      }
      if (states.contains(MaterialState.focused)) {
        return CustomColors.getCustomColors().textColor!.getShade(400);
      }
      return CustomColors.getCustomColors().textColor!.getShade(300);
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) =>
        CustomColors.getCustomColors().textColor!.getShade(100),
  ),
);

final _appSecondaryOutlineButton = _appOutlineButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade400;
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade500;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade300;
      }
      if (states.contains(MaterialState.focused)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade300;
      }
      return Colors.transparent;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return CustomColors.getCustomColors().textColor!.getShade(500);
      }
      return CustomColors.getCustomColors().textColor!.getShade(300);
    },
  ),
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) => BorderSide(
      color: CustomColors.getCustomColors().textColor!.getShade(300)!,
    ),
  ),
);

final _appSecondaryTextButton = _appTextButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade300;
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade500;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade200;
      }
      if (states.contains(MaterialState.focused)) {
        return AppColorScheme.getDefaultColorScheme().surface.shade200;
      }
      return Colors.transparent;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return CustomColors.getCustomColors().textColor!.getShade(500);
      }
      return CustomColors.getCustomColors().textColor!.getShade(300);
    },
  ),
);
