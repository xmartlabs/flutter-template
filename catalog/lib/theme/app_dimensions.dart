
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
      spacing2: lerpInt(spacing2, other.spacing2, t),
      spacing4: lerpInt(spacing2, other.spacing2, t),
      spacing8: lerpInt(spacing2, other.spacing2, t),
      spacing12: lerpInt(spacing2, other.spacing2, t),
      spacing16: lerpInt(spacing2, other.spacing2, t),
      spacing20: lerpInt(spacing2, other.spacing2, t),
      spacing24: lerpInt(spacing2, other.spacing2, t),
    );
  }

  int lerpInt(int a, int b, double t) {
    t = t.clamp(0.0, 1.0);
    return ((1 - t) * a + t * b).round();
  }
}
