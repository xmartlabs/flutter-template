//ignore_for_file: prefer-moving-to-variable, unused-files, unused-code
import 'package:design_system/design_system.dart';
import 'package:design_system/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String value)? onChange;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTrailingIconPress;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool obscureText;
  final int? maxLength;
  final int minLines;
  final int maxLines;
  final bool hasScreenBottomNavigation;
  final int? currentLength;

  const AppTextField({
    required this.controller,
    super.key,
    this.onChange,
    this.errorText,
    this.labelText,
    this.prefixIcon,
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
    this.currentLength = 0,
    this.hasScreenBottomNavigation = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    final textColor = context.theme.customColors.textColor!.getShade(400);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Text(
              widget.labelText!,
              textAlign: TextAlign.left,
              style: context.theme.textStyles.labelMedium!
                  .bold()
                  .copyWith(color: textColor),
            ),
          ),
        SizedBox(height: 5.h),
        TextField(
          maxLength: widget.maxLength,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          cursorHeight: 24,
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          onChanged: widget.onChange,
          style:
              context.theme.textStyles.bodyMedium?.copyWith(color: textColor),
          decoration: InputDecoration(
            helperText: widget.helperText,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            errorText: widget.errorText,
          ),
          keyboardType: widget.keyboardType,
          enabled: widget.enabled,
          obscureText: widget.obscureText,
        ),
      ],
    );
  }
}
