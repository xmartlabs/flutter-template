import 'package:flutter/material.dart';

Color? getMaterialStatesColor(
  Set<MaterialState> states,
  Color baseColor, [
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
]) {
  switch(MaterialState){
    case MaterialState.disabled: return customDisabledColor;
    case MaterialState.focused: return customFocusedColor;
    case MaterialState.hovered:  return customHoveredColor;
    case MaterialState.pressed:   return baseColor;
    case MaterialState.dragged:
    case MaterialState.error:
    case MaterialState.selected:
    case MaterialState.scrolledUnder:
      return defaultColor ?? Colors.transparent;
  }
}
