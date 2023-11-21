import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:catalog/widgets/app_base_button.dart';

class AppSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Icon? iconLeft;
  final Icon? iconRight;
  final StyleButton style;
  final bool isSelected;
  final Color? borderColor;
  final double? horizontalPadding;

  const AppSecondaryButton({
    required this.text,
    required this.onPressed,
    required this.style,
    super.key,
    this.iconLeft,
    this.iconRight,
    this.borderColor,
    this.isSelected = false,
    this.horizontalPadding,
  });

  factory AppSecondaryButton.stroke(
    String text,
    VoidCallback? onPressed, {
    Icon? iconLeft,
    Icon? iconRight,
    bool isSelected = false,
  }) =>
      AppSecondaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.stroke,
        iconRight: iconRight,
        iconLeft: iconLeft,
        isSelected: isSelected,
      );

  factory AppSecondaryButton.filled(
    String text,
    VoidCallback? onPressed, {
    Icon? iconLeft,
    Icon? iconRight,
    bool isSelected = false,
    double? horizontalPadding,
  }) =>
      AppSecondaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.filled,
        iconRight: iconRight,
        iconLeft: iconLeft,
        isSelected: isSelected,
        horizontalPadding: horizontalPadding,
      );

  factory AppSecondaryButton.ghost(
    String text,
    VoidCallback? onPressed, {
    Icon? iconLeft,
    Icon? iconRight,
    bool isSelected = false,
  }) =>
      AppSecondaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.ghost,
        iconRight: iconRight,
        iconLeft: iconLeft,
        isSelected: isSelected,
      );

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case StyleButton.filled:
        return _secondaryFilledButton(context);
      case StyleButton.stroke:
        return _secondaryStrokeButton(context);
      case StyleButton.ghost:
        return _secondaryGhostButton(context);
    }
  }

  AppBaseButton _secondaryGhostButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        verticalPadding: 10,
        backgroundColor: isSelected
            ? context.theme.colors.onSurface.shade300
            : Colors.transparent,
        textColor: isSelected
            ? context.theme.colors.textColor.shade500
            : context.theme.colors.textColor.shade300,
        disabledColor: Colors.transparent,
        borderSideColor: Colors.transparent,
        focusColor: context.theme.colors.surface.shade200,
        pressedColor: context.theme.colors.surface.shade300,
        disabledTextColor: context.theme.colors.textColor.shade200,
        hoveredColor: context.theme.colors.surface.shade200,
      );

  AppBaseButton _secondaryStrokeButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        verticalPadding: 10,
        iconRight: iconRight,
        backgroundColor: isSelected
            ? context.theme.colors.surface.shade100
            : context.theme.colors.surface.shade100,
        textColor: context.theme.colors.textColor.shade300,
        disabledColor: context.theme.colors.surface.shade500,
        focusColor: context.theme.colors.surface.shade300,
        pressedColor: context.theme.colors.surface.shade400,
        disabledTextColor: context.theme.colors.textColor.shade300,
        borderSideColor: context.theme.colors.textColor.shade300,
        hoveredColor: context.theme.colors.surface.shade300,
      );

  AppBaseButton _secondaryFilledButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        verticalPadding: 10,
        backgroundColor: context.theme.colors.textColor.shade300,
        textColor: context.theme.colors.textColor.shade100,
        disabledColor: context.theme.colors.surface.shade500,
        focusColor: context.theme.colors.textColor.shade400,
        pressedColor: context.theme.colors.textColor.shade500,
        disabledTextColor: context.theme.colors.textColor.shade300,
        hoveredColor: context.theme.colors.onSurface.shade400,
        borderSideColor: borderColor ??
            (isSelected
                ? context.theme.colors.textColor.shade300
                : Colors.transparent),
      );
}
