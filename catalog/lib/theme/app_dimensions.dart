import 'package:flutter/material.dart';

class AppDimension extends ThemeExtension<AppDimension> {
  final int spacing2;
  final int spacing4;
  final int spacing8;
  final int spacing12;
  final int spacing16;
  final int spacing20;
  final int spacing24;

  AppDimension({
    required this.spacing2,
    required this.spacing4,
    required this.spacing8,
    required this.spacing12,
    required this.spacing16,
    required this.spacing20,
    required this.spacing24,
  });

  static AppDimension getDefaultDimensions() => AppDimension(
        spacing2: 2,
        spacing4: 4,
        spacing8: 8,
        spacing12: 12,
        spacing16: 16,
        spacing20: 20,
        spacing24: 24,
      );

  @override
  AppDimension copyWith({MaterialColor? primary}) =>
      AppDimension.getDefaultDimensions();

  @override
  AppDimension lerp(AppDimension? other, double t) {
    if (other is! AppDimension) {
      return this;
    }
    return AppDimension(
      spacing2: _lerpInt(spacing2, other.spacing2, t).toInt(),
      spacing4: _lerpInt(spacing4, other.spacing4, t).toInt(),
      spacing8: _lerpInt(spacing8, other.spacing8, t).toInt(),
      spacing12: _lerpInt(spacing12, other.spacing12, t).toInt(),
      spacing16: _lerpInt(spacing16, other.spacing16, t).toInt(),
      spacing20: _lerpInt(spacing20, other.spacing20, t).toInt(),
      spacing24: _lerpInt(spacing24, other.spacing24, t).toInt(),
    );
  }

  double _lerpInt(int oldValue, int newValue, double factor) =>
      oldValue + (newValue - oldValue) * factor;
}
