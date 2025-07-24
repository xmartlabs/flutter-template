import 'dart:math';
import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color getShade(int shade) => this is MaterialColor
      ? (this as MaterialColor)[shade]!
      : _generateMaterialColor();

  MaterialColor _generateMaterialColor() => MaterialColor(toARGB32(), {
        50: _tintColor(0.9),
        100: _tintColor(0.8),
        200: _tintColor(0.6),
        300: _tintColor(0.4),
        400: _tintColor(0.2),
        500: this,
        600: _shadeColor(0.1),
        700: _shadeColor(0.2),
        800: _shadeColor(0.3),
        900: _shadeColor(0.4),
      });

  int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color _tintColor(double factor) => Color.fromRGBO(
        _tintValue((r * 255.0).round() & 0xff, factor),
        _tintValue((g * 255.0).round() & 0xff, factor),
        _tintValue((b * 255.0).round() & 0xff, factor),
        1,
      );

  int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color _shadeColor(double factor) => Color.fromRGBO(
        _shadeValue((r * 255.0).round() & 0xff, factor),
        _shadeValue((g * 255.0).round() & 0xff, factor),
        _shadeValue((b * 255.0).round() & 0xff, factor),
        1,
      );

  // Color? get shade100 => _getShade(100);
  //
  // Color? get shade200 => _getShade(200);
  //
  // Color? get shade300 => _getShade(300);
  //
  // Color? get shade400 => _getShade(400);
  //
  // Color? get shade500 => _getShade(500);
  //
  // Color? get shade600 => _getShade(600);
  //
  // Color? get shade700 => _getShade(700);
  //
  // Color? get shade800 => _getShade(800);
  //
  // Color? get shade900 => _getShade(900);
  //
  // Color? get shade1000 => _getShade(1000);
}
