import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSelectionControl<T> extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onPressed;
  final bool? isRadioButton;

  const AppSelectionControl({
    required this.isSelected,
    required this.label,
    required this.onPressed,
    this.isRadioButton = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40.h,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                padding: EdgeInsets.symmetric(vertical: 0.h),
                onPressed: onPressed,
                icon: Row(
                  children: [
                    _getIcon(context),
                    SizedBox(width: 5.w),
                    Text(
                      label,
                      style: context.theme.textStyles.labelMedium,
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _getIcon(BuildContext context) => isSelected
      ? Icon(
          isRadioButton!
              ? Icons.radio_button_checked_outlined
              : Icons.check_box_outlined,
          color: context.theme.colors.primary.shade500,
        )
      : Icon(
          isRadioButton!
              ? Icons.radio_button_unchecked_outlined
              : Icons.check_box_outline_blank,
          color: context.theme.colors.textColor.shade100,
        );
}
