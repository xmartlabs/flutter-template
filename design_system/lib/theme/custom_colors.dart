// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.textColor,
    required this.info,
    required this.success,
    required this.warning,
    required this.danger,
  }) : super();

  final Color? textColor;
  final Color? info;
  final Color? success;
  final Color? warning;
  final Color? danger;

  static CustomColors getCustomColors() => const CustomColors(
        textColor: MaterialColor(
          0xff414158,
          <int, Color>{
            100: Color(0xffffffff),
            200: Color(0xffc2c2cc),
            300: Color(0xff8a8aa8),
            400: Color(0xff414158),
            500: Color(0xff1d1616),
          },
        ),
        info: MaterialColor(
          0xff1169f7,
          <int, Color>{
            100: Color(0xffcfe8fe),
            200: Color(0xff6fb0fc),
            300: Color(0xff1169f7),
            400: Color(0xff083cb1),
            500: Color(0xff031d76),
          },
        ),
        success: MaterialColor(
          0xff8ec144,
          <int, Color>{
            100: Color(0xffeaf4dd),
            200: Color(0xffc6dfa1),
            300: Color(0xff8ec144),
            400: Color(0xff5d7f2a),
            500: Color(0xff435c1f),
          },
        ),
        warning: MaterialColor(
          0xffffbf00,
          <int, Color>{
            100: Color(0xfffff2cc),
            200: Color(0xffffdc73),
            300: Color(0xffffbf00),
            400: Color(0xffe5b217),
            500: Color(0xff99770f),
          },
        ),
        danger: MaterialColor(
          0xfff4642c,
          <int, Color>{
            100: Color(0xfffeebd4),
            200: Color(0xfffbb37f),
            300: Color(0xfff4642c),
            400: Color(0xffd74824),
            500: Color(0xff750908),
          },
        ),
      );

  @override
  CustomColors copyWith({MaterialColor? primary}) =>
      CustomColors.getCustomColors();

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      textColor: Color.lerp(textColor, other.textColor, t),
      info: Color.lerp(info, other.info, t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  @override
  Object get type => CustomColors;
}
