import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/theme/app_colors.dart';

class AppButtons {
  final ButtonStyle filledButton = _appFilledButton;
  final ButtonStyle outlineButton = _appOutlineButton;
  final ButtonStyle textButton = _appTextButton;
  final ButtonStyle secondaryFilledButton = _appSecondaryFilledButton;
  final ButtonStyle secondaryOutlineButton = _appSecondaryOutlineButton;
  final ButtonStyle secondaryTextButton = _appSecondaryTextButton;

  AppButtons();

  static AppButtons getButtonTheme() => AppButtons();
}

final _appFilledButton = FilledButton.styleFrom(
  minimumSize: Size(double.infinity, 50.h),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
    side: const BorderSide(
      width: 2,
      color: Colors.transparent,
    ),
  ),
  elevation: 0.0,
  textStyle: TextStyle(
    color: AppColors.getColorScheme().textColor.shade100,
  ),
  foregroundColor: AppColors.getColorScheme().textColor.shade100,
);

final _appOutlineButton = OutlinedButton.styleFrom(
  minimumSize: Size(double.infinity, 50.h),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  ),
  side: BorderSide(
    width: 2,
    color: AppColors.getColorScheme().primary,
  ),
  textStyle: TextStyle(
    color: AppColors.getColorScheme().textColor.shade100,
  ),
  elevation: 0.0,
);

final _appTextButton = TextButton.styleFrom(
  minimumSize: Size(double.infinity, 50.h),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
    side: const BorderSide(
      width: 2,
      color: Colors.transparent,
    ),
  ),
  textStyle: TextStyle(
    color: AppColors.getColorScheme().textColor.shade100,
  ),
  elevation: 0.0,
);

final _appSecondaryFilledButton = _appFilledButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.getColorScheme().textColor.shade500;
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColors.getColorScheme().surface.shade500;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColors.getColorScheme().onSurface.shade400;
      }
      if (states.contains(MaterialState.focused)) {
        return AppColors.getColorScheme().textColor.shade400;
      }
      return AppColors.getColorScheme().textColor.shade300;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) =>
        AppColors.getColorScheme().textColor.shade100,
  ),
);

final _appSecondaryOutlineButton = _appOutlineButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.getColorScheme().surface.shade400;
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColors.getColorScheme().surface.shade500;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColors.getColorScheme().surface.shade300;
      }
      if (states.contains(MaterialState.focused)) {
        return AppColors.getColorScheme().surface.shade300;
      }
      return AppColors.getColorScheme().surface.shade100;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.getColorScheme().textColor.shade500;
      }
      return AppColors.getColorScheme().textColor.shade300;
    },
  ),
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) => BorderSide(
      color: AppColors.getColorScheme().textColor.shade300,
    ),
  ),
);

final _appSecondaryTextButton = _appTextButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.getColorScheme().surface.shade300;
      }
      if (states.contains(MaterialState.disabled)) {
        return AppColors.getColorScheme().surface.shade500;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColors.getColorScheme().surface.shade200;
      }
      if (states.contains(MaterialState.focused)) {
        return AppColors.getColorScheme().surface.shade200;
      }
      return Colors.transparent;
    },
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.getColorScheme().textColor.shade500;
      }
      return AppColors.getColorScheme().textColor.shade300;
    },
  ),
);
