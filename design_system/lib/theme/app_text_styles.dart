//ignore_for_file: unused-files, unused-code

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const FontWeight _semiboldWeight = FontWeight.w600;

final _isTesting = Platform.environment.containsKey('FLUTTER_TEST');

class AppTextStyles extends TextTheme {
  const AppTextStyles({
    super.headlineLarge,
    super.headlineMedium,
    super.headlineSmall,
    super.bodyLarge,
    super.bodyMedium,
    super.bodySmall,
    super.titleLarge,
    super.titleMedium,
    super.titleSmall,
    super.labelLarge,
    super.labelMedium,
    super.labelSmall,
  });

  factory AppTextStyles.fromTextTheme({
    required TextTheme textTheme,
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
      );

  static TextStyle _robotoTextStyle(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      _isTesting
          ? TextStyle(fontSize: fontSize, fontWeight: fontWeight)
          : GoogleFonts.roboto(
              fontSize: fontSize,
              fontWeight: fontWeight,
            );

  static AppTextStyles getDefaultAppStyles() =>
      _isTesting ? _testingTextTheme() : _appTextTheme();

  static AppTextStyles _appTextTheme() => AppTextStyles.fromTextTheme(
        textTheme: GoogleFonts.robotoTextTheme().copyWith(
          labelLarge: _robotoTextStyle(20.sp, FontWeight.normal),
          labelMedium: _robotoTextStyle(16.sp, FontWeight.normal),
          labelSmall: _robotoTextStyle(14.sp, FontWeight.normal),
          headlineMedium: _robotoTextStyle(20.sp, FontWeight.bold),
          headlineLarge: _robotoTextStyle(24.sp, FontWeight.bold),
        ),
      );

  static AppTextStyles _testingTextTheme() => AppTextStyles.fromTextTheme(
        textTheme: TextTheme(
          labelLarge: _robotoTextStyle(20.sp, FontWeight.normal),
          labelMedium: _robotoTextStyle(16.sp, FontWeight.normal),
          labelSmall: _robotoTextStyle(14.sp, FontWeight.normal),
          headlineMedium: _robotoTextStyle(20.sp, FontWeight.bold),
          headlineLarge: _robotoTextStyle(24.sp, FontWeight.bold),
        ),
      );

  TextTheme getThemeData() => getDefaultAppStyles();
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
