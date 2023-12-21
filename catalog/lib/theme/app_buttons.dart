import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalog/theme/app_color_scheme.dart';
import 'package:catalog/theme/custom_colors.dart';
import 'package:catalog/theme/custom_text_styles.dart';
import 'package:catalog/common/helper.dart';

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
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  ),
  textStyle: CustomTextStyles.getCustomTextStyles().buttonLarge,
  elevation: 0.0,
  foregroundColor: CustomColors.getCustomColors().textColor!.shade100,
);

final _appOutlineButton = OutlinedButton.styleFrom(
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
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
  textStyle: CustomTextStyles.getCustomTextStyles().buttonLarge,
  elevation: 0.0,
);

final _appSecondaryFilledButton = _appFilledButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) => getMaterialStatesColor(
      states,
      CustomColors.getCustomColors().textColor!.shade500!,
      AppColorScheme.getDefaultColorScheme().surface.shade500,
      AppColorScheme.getDefaultColorScheme().onSurface.shade400,
      CustomColors.getCustomColors().textColor!.shade400,
      CustomColors.getCustomColors().textColor!.shade300,
    ),
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) => getMaterialStatesColor(
      states,
      CustomColors.getCustomColors().textColor!.shade100!,
    ),
  ),
);

final _appSecondaryOutlineButton = _appOutlineButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) => getMaterialStatesColor(
      states,
      AppColorScheme.getDefaultColorScheme().surface.shade400,
      AppColorScheme.getDefaultColorScheme().surface.shade500,
      AppColorScheme.getDefaultColorScheme().surface.shade300,
      AppColorScheme.getDefaultColorScheme().surface.shade300,
    ),
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) => getMaterialStatesColor(
      states,
      CustomColors.getCustomColors().textColor!.shade500!,
      null,
      CustomColors.getCustomColors().textColor!.shade300,
    ),
  ),
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) => BorderSide(
      color: CustomColors.getCustomColors().textColor!.shade300!,
    ),
  ),
);

final _appSecondaryTextButton = _appTextButton.copyWith(
  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) => getMaterialStatesColor(
      states,
      AppColorScheme.getDefaultColorScheme().surface.shade300,
      AppColorScheme.getDefaultColorScheme().surface.shade500,
      AppColorScheme.getDefaultColorScheme().surface.shade200,
      AppColorScheme.getDefaultColorScheme().surface.shade200,
    ),
  ),
  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) => getMaterialStatesColor(
      states,
      CustomColors.getCustomColors().textColor!.shade500!,
      CustomColors.getCustomColors().textColor!.shade300!,
    ),
  ),
);
