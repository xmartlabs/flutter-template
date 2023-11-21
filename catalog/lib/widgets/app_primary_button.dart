import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:catalog/widgets/app_base_button.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Icon? iconLeft;
  final Icon? iconRight;
  final StyleButton style;

  const AppPrimaryButton({
    required this.text,
    required this.onPressed,
    required this.style,
    this.iconLeft,
    this.iconRight,
    super.key,
  });

  factory AppPrimaryButton.stroke(
    String text,
    VoidCallback? onPressed, {
    Icon? iconLeft,
    Icon? iconRight,
  }) =>
      AppPrimaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.stroke,
        iconRight: iconRight,
        iconLeft: iconLeft,
      );

  factory AppPrimaryButton.filled(
    String text,
    VoidCallback? onPressed, {
    Icon? iconLeft,
    Icon? iconRight,
  }) =>
      AppPrimaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.filled,
        iconRight: iconRight,
        iconLeft: iconLeft,
      );

  factory AppPrimaryButton.ghost(
    String text,
    VoidCallback? onPressed, {
    Icon? iconLeft,
    Icon? iconRight,
  }) =>
      AppPrimaryButton(
        text: text,
        onPressed: onPressed,
        style: StyleButton.ghost,
        iconRight: iconRight,
        iconLeft: iconLeft,
      );

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case StyleButton.filled:
        return _primaryFilledButton(context);
      case StyleButton.stroke:
        return _primaryStrokeButton(context);
      case StyleButton.ghost:
        return _primaryGhostButton(context);
    }
  }

  AppBaseButton _primaryGhostButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        backgroundColor: Colors.transparent,
        textColor: context.theme.colors.primary.shade500,
        disabledColor: Colors.transparent,
        focusColor: context.theme.colors.primary.shade200,
        pressedColor: context.theme.colors.primary.shade200,
        disabledTextColor: context.theme.colors.textColor.shade300,
        hoveredColor: context.theme.colors.primary.shade100,
      );

  AppBaseButton _primaryStrokeButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        backgroundColor: context.theme.colors.surface.shade100,
        textColor: context.theme.colors.primary.shade500,
        disabledColor: context.theme.colors.surface.shade500,
        focusColor: context.theme.colors.primary.shade200,
        pressedColor: context.theme.colors.primary.shade300,
        disabledTextColor: context.theme.colors.textColor.shade300,
        borderSideColor: context.theme.colors.primary.shade500,
        hoveredColor: context.theme.colors.primary.shade100,
      );

  AppBaseButton _primaryFilledButton(BuildContext context) => AppBaseButton(
        text: text,
        onPressed: onPressed,
        iconLeft: iconLeft,
        iconRight: iconRight,
        backgroundColor: context.theme.colors.primary.shade500,
        textColor: context.theme.colors.textColor.shade100,
        disabledColor: context.theme.colors.surface.shade500,
        focusColor: context.theme.colors.primary.shade500,
        pressedColor: context.theme.colors.primary.shade600,
        disabledTextColor: context.theme.colors.textColor.shade300,
        hoveredColor: context.theme.colors.primary.shade400,
      );
}
