//ignore_for_file: unused-files, unused-code

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const FontWeight _semiboldWeight = FontWeight.w600;

class AppTextStyles extends TextTheme {
  final TextStyle tinyText;
  final TextStyle customOverline;
  final TextStyle buttonXLarge;
  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;
  final TextStyle buttonXSmall;
  final TextStyle buttonTiny;
  final TextStyle bodyXSmall;

  const AppTextStyles({
    required this.tinyText,
    required this.buttonXLarge,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
    required this.buttonXSmall,
    required this.bodyXSmall,
    required this.buttonTiny,
    required this.customOverline,
    headlineLarge,
    headlineMedium,
    headlineSmall,
    bodyLarge,
    bodyMedium,
    bodySmall,
    titleLarge,
    titleMedium,
    titleSmall,
    labelLarge,
    TextStyle? labelMedium,
    labelSmall,
    labelXSmall,
  }) : super(
          bodyLarge: bodyLarge,
          headlineLarge: headlineLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelMedium: labelMedium,
          labelSmall: labelSmall,
        );

  factory AppTextStyles.fromTextTheme({
    required TextTheme textTheme,
    required TextStyle customOverline,
    required TextStyle tinyText,
    required TextStyle buttonXLarge,
    required TextStyle buttonLarge,
    required TextStyle buttonMedium,
    required TextStyle buttonSmall,
    required TextStyle buttonXSmall,
    required TextStyle bodyXSmall,
    required TextStyle labelXSmall,
    required TextStyle buttonTiny,
  }) =>
      AppTextStyles(
        headlineSmall: textTheme.headlineSmall,
        headlineMedium: textTheme.headlineMedium,
        headlineLarge: textTheme.headlineLarge,
        bodyLarge: textTheme.bodyLarge,
        bodyMedium: textTheme.bodyMedium,
        bodySmall: textTheme.bodySmall,
        titleLarge: textTheme.titleLarge,
        titleMedium: textTheme.titleMedium,
        titleSmall: textTheme.titleSmall,
        labelLarge: textTheme.labelLarge,
        labelMedium: textTheme.labelMedium,
        labelSmall: textTheme.labelSmall,
        tinyText: tinyText,
        customOverline: customOverline,
        buttonXLarge: buttonXLarge,
        buttonLarge: buttonLarge,
        buttonMedium: buttonMedium,
        buttonSmall: buttonSmall,
        buttonTiny: buttonTiny,
        buttonXSmall: buttonXSmall,
        bodyXSmall: bodyXSmall,
        labelXSmall: labelXSmall,
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

  static AppTextStyles getAppStyles() => AppTextStyles.fromTextTheme(
        textTheme: GoogleFonts.robotoTextTheme().copyWith(
          labelLarge: _robotoTextStyle(20.sp, FontWeight.normal),
          labelMedium: _robotoTextStyle(16.sp, FontWeight.normal),
          labelSmall: _robotoTextStyle(14.sp, FontWeight.normal),
          headlineMedium: _robotoTextStyle(20.sp, FontWeight.bold),
          headlineLarge: _robotoTextStyle(24.sp, FontWeight.bold),
        ),
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

  TextTheme getThemeData() => getAppStyles();
}

extension TextStyleExtensions on TextStyle {
  TextStyle links() => copyWith(
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: color,
      );

  TextStyle semibold() => copyWith(fontWeight: _semiboldWeight);

  TextStyle bold() => copyWith(fontWeight: FontWeight.bold);

  TextStyle regular() => copyWith(fontWeight: FontWeight.normal);
}
