import 'dart:math';
import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color _getShade(int shade) {
    if (this is MaterialColor) {
      return (this as MaterialColor)[shade]!;
    } else {
      return generateMaterialColor();
    }
  }

  MaterialColor generateMaterialColor() => MaterialColor(value, {
        50: tintColor(this, 0.9),
        100: tintColor(this, 0.8),
        200: tintColor(this, 0.6),
        300: tintColor(this, 0.4),
        400: tintColor(this, 0.2),
        500: this,
        600: shadeColor(this, 0.1),
        700: shadeColor(this, 0.2),
        800: shadeColor(this, 0.3),
        900: shadeColor(this, 0.4),
      });

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
        tintValue(color.red, factor),
        tintValue(color.green, factor),
        tintValue(color.blue, factor),
        1,
      );

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
        shadeValue(color.red, factor),
        shadeValue(color.green, factor),
        shadeValue(color.blue, factor),
        1,
      );

  Color? get shade100 => _getShade(100);

  Color? get shade200 => _getShade(200);

  Color? get shade300 => _getShade(300);

  Color? get shade400 => _getShade(400);

  Color? get shade500 => _getShade(500);

  Color? get shade600 => _getShade(600);

  Color? get shade700 => _getShade(700);

  Color? get shade800 => _getShade(800);

  Color? get shade900 => _getShade(900);

  Color? get shade1000 => _getShade(1000);
}
