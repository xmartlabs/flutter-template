// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const FontWeight _semiboldWeight = FontWeight.w600;

@immutable
class TextStylesExtensions extends ThemeExtension<TextStylesExtensions> {
  const TextStylesExtensions({
    required this.tinyText,
    required this.customOverline,
    required this.buttonXLarge,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
    required this.buttonXSmall,
    required this.buttonTiny,
    required this.labelXSmall,
    required this.bodyXSmall,
  }) : super();

  final TextStyle tinyText;
  final TextStyle customOverline;
  final TextStyle buttonXLarge;
  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;
  final TextStyle buttonXSmall;
  final TextStyle buttonTiny;
  final TextStyle bodyXSmall;
  final TextStyle labelXSmall;

  static TextStylesExtensions getAppStyles() =>  TextStylesExtensions(
    tinyText: _robotoTextStyle(10.sp, FontWeight.normal),
    customOverline: _robotoTextStyle(10.sp, FontWeight.normal),
    buttonXLarge: _robotoTextStyle(24.sp, _semiboldWeight),
    buttonLarge: _robotoTextStyle(16.sp, _semiboldWeight),
    buttonMedium: _robotoTextStyle(14.sp, _semiboldWeight),
    buttonSmall: _robotoTextStyle(12.sp, _semiboldWeight),
    buttonXSmall: _robotoTextStyle(10.sp, _semiboldWeight),
    bodyXSmall: _robotoTextStyle(12.sp, _semiboldWeight),
    labelXSmall: _robotoTextStyle(12.sp, _semiboldWeight),
    buttonTiny: _robotoTextStyle(10.sp, _semiboldWeight),
  );

  static TextStyle _robotoTextStyle(
      double fontSize,
      FontWeight fontWeight,
      ) =>
      GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.white,
      );

  @override
  TextStylesExtensions copyWith({MaterialColor? primary}) =>
      TextStylesExtensions.getAppStyles();

  @override
  TextStylesExtensions lerp(TextStylesExtensions? other, double t) {
    if (other is! TextStylesExtensions) {
      return this;
    }
    return TextStylesExtensions(
      tinyText: TextStyle.lerp(tinyText, other.tinyText, t)!,
      customOverline: TextStyle.lerp(customOverline, other.customOverline, t)!,
      buttonXLarge: TextStyle.lerp(buttonXLarge, other.buttonXLarge, t)!,
      buttonLarge: TextStyle.lerp(buttonLarge, other.buttonLarge, t)!,
      buttonMedium: TextStyle.lerp(buttonMedium, other.buttonMedium, t)!,
      buttonSmall: TextStyle.lerp(buttonSmall, other.buttonSmall, t)!,
      buttonXSmall: TextStyle.lerp(buttonXSmall, other.buttonXSmall, t)!,
      buttonTiny: TextStyle.lerp(buttonTiny, other.buttonTiny, t)!,
      bodyXSmall: TextStyle.lerp(bodyXSmall, other.bodyXSmall, t)!,
      labelXSmall: TextStyle.lerp(labelXSmall, other.labelXSmall, t)!,
    );
  }

  @override
  Object get type => TextStylesExtensions;
}
