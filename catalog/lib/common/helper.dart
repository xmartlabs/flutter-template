import 'package:flutter/material.dart';

Color? getMaterialStatesColor(
  Set<MaterialState> states,
  Color baseColor, [
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
]) {
  if (states.contains(MaterialState.pressed)) {
    return baseColor;
  }
  if (states.contains(MaterialState.disabled)) {
    return customDisabledColor;
  }
  if (states.contains(MaterialState.hovered)) {
    return customHoveredColor;
  }
  if (states.contains(MaterialState.focused)) {
    return customFocusedColor;
  }
  return defaultColor ?? Colors.transparent;
}
