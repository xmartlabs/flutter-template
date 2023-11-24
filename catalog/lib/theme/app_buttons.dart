import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/theme/app_colors.dart';

class AppButtons extends ButtonStyle {
  final ButtonStyle primary = _appPrimaryButton;
  final ButtonStyle secondary = _appSecondaryButton;

  AppButtons();

  static AppButtons getButtonTheme() => AppButtons();
}

final _appPrimaryButton = FilledButton.styleFrom(
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
  backgroundColor: AppColors.getColorScheme().primary.shade500,
  disabledBackgroundColor: AppColors.getColorScheme().surface.shade500,
);

final _appSecondaryButton = FilledButton.styleFrom(
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
  backgroundColor: AppColors.getColorScheme().textColor.shade300,
  disabledBackgroundColor: AppColors.getColorScheme().surface.shade500,
);
