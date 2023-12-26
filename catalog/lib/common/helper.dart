import 'package:catalog/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

Color? _getMaterialStatesColor(
  MaterialState states,
  Color baseColor, [
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
]) =>
    switch (states) {
      MaterialState.disabled => customDisabledColor ?? baseColor.shade500,
      MaterialState.focused => customFocusedColor ?? baseColor.shade400,
      MaterialState.hovered => customHoveredColor ?? baseColor.shade300,
      MaterialState.pressed => baseColor.shade400,
      _ => defaultColor ?? Colors.transparent,
    };

MaterialStateProperty<Color?> getMaterialStatesColors(
  Color baseColor, [
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
]) =>
    MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      for (final element in states) {
        return _getMaterialStatesColor(element, baseColor);
      }
      return baseColor;
    });
