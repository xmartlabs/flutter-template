import 'package:design_system/extensions/color_extensions.dart';
import 'package:flutter/material.dart';

Color _getMaterialStatesColor(
  WidgetState states,
  Color baseColor, {
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
}) =>
    switch (states) {
      WidgetState.disabled => customDisabledColor ?? baseColor.getShade(500),
      WidgetState.focused => customFocusedColor ?? baseColor
        ..getShade(400),
      WidgetState.hovered => customHoveredColor ?? baseColor.getShade(300),
      WidgetState.pressed => baseColor.getShade(400),
      _ => defaultColor ?? Colors.transparent,
    };

WidgetStateColor getMaterialStatesColors(
  Color baseColor, {
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
}) =>
    WidgetStateColor.resolveWith((Set<WidgetState> states) {
      for (final element in states) {
        return _getMaterialStatesColor(element, baseColor);
      }
      return baseColor;
    });

WidgetStateProperty<BorderSide?> getBorderSidesStates(
  Color baseColor, {
  Color? customDisabledColor,
  Color? defaultColor,
  Color? customHoveredColor,
  Color? customFocusedColor,
}) =>
    WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states) {
      for (final element in states) {
        return BorderSide(color: _getMaterialStatesColor(element, baseColor));
      }
      return BorderSide(color: baseColor);
    });
