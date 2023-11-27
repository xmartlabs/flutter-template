//ignore_for_file: prefer-moving-to-variable, unused-files, unused-code
import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value)? onChange;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final IconData? leadingIcon;
  final Widget? suffixIcon;
  final void Function()? onTrailingIconPress;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool obscureText;
  final int? maxLength;
  final int minLines;
  final int maxLines;
  final bool hasScreenBottomNavigation;

  const AppTextField({
    required this.controller,
    super.key,
    this.onChange,
    this.errorText,
    this.labelText,
    this.leadingIcon,
    this.suffixIcon,
    this.onTrailingIconPress,
    this.keyboardType,
    this.enabled = true,
    this.obscureText = false,
    this.maxLength,
    this.minLines = 1,
    this.helperText,
    this.hintText,
    this.maxLines = 1,
    this.hasScreenBottomNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineBorder(Color color) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: color,
          ),
        );
    final colors = context.theme.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Text(
              labelText!,
              textAlign: TextAlign.left,
              style: context.theme.textStyles.labelMedium!
                  .bold()
                  .copyWith(color: colors.textColor.shade400),
            ),
          ),
        SizedBox(height: 5.h),
        TextField(
          scrollPadding: hasScreenBottomNavigation
              ? EdgeInsets.only(bottom: 140.h)
              : const EdgeInsets.all(20.0),
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          cursorHeight: 24,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          onChanged: onChange,
          style: context.theme.textStyles.bodyMedium
              ?.copyWith(color: colors.textColor.shade400),
          decoration: InputDecoration(
            helperText: helperText,
            hintText: hintText,
            labelStyle: context.theme.textStyles.bodyMedium
                ?.copyWith(color: context.theme.colors.textColor.shade400),
            filled: true,
            helperStyle: context.theme.textStyles.bodySmall
                ?.copyWith(color: context.theme.colors.textColor.shade300),
            counterText: "",
            hintStyle: context.theme.textStyles.bodyMedium
                ?.copyWith(color: context.theme.colors.textColor.shade300),
            border: outlineBorder(context.theme.colors.textColor.shade100),
            fillColor: colors.surface.shade300,
            enabledBorder:
                outlineBorder(context.theme.colors.textColor.shade200),
            errorBorder: outlineBorder(colors.danger.shade300),
            focusedBorder: outlineBorder(colors.primary.shade800),
            disabledBorder: outlineBorder(colors.textColor.shade200),
            focusedErrorBorder: outlineBorder(colors.error),
            errorStyle: context.theme.textStyles.labelSmall
                ?.copyWith(color: colors.danger),
            prefixIcon: Icon(
              Icons.close,
              color: colors.textColor.shade200,
            ),
            suffixIcon: Icon(
              Icons.close,
              color: colors.textColor.shade200,
            ),
            errorText: errorText,
            errorMaxLines: 2,
            hoverColor: colors.primary.shade400,
            focusColor: colors.primary.shade800,
          ),
          keyboardType: keyboardType,
          enabled: enabled,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
