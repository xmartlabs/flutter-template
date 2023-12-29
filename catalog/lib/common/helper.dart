import 'package:catalog/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

Color? _getMaterialStatesColor(
  MaterialState states,
  Color baseColor, {
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
}) =>
    switch (states) {
      MaterialState.disabled => customDisabledColor ?? baseColor.getShade(500),
      MaterialState.focused => customFocusedColor ?? baseColor
        ..getShade(400),
      MaterialState.hovered => customHoveredColor ?? baseColor.getShade(300),
      MaterialState.pressed => baseColor.getShade(400),
      _ => defaultColor ?? Colors.transparent,
    };

MaterialStateProperty<Color?> getMaterialStatesColors(
  Color baseColor, {
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
}) =>
    MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      for (final element in states) {
        return _getMaterialStatesColor(element, baseColor);
      }
      return baseColor;
    });

MaterialStateProperty<BorderSide?> getBorderSidesStates(
  Color baseColor, {
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
}) =>
    MaterialStateProperty.resolveWith<BorderSide?>((Set<MaterialState> states) {
      for (final element in states) {
        return BorderSide(color: _getMaterialStatesColor(element, baseColor)!);
      }
      return BorderSide(color: baseColor);
    });
