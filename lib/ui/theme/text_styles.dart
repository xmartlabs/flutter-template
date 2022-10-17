import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles extends TextTheme {
  final TextStyle customStyle;

  AppStyles({
    required this.customStyle,
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
    labelMedium,
    labelSmall,
  }) : super(
          bodyLarge: bodyLarge,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodyMedium: bodyMedium,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelSmall: labelSmall,
        );

  factory AppStyles.fromTextTheme({
    required TextStyle customStyle,
    required TextTheme textTheme,
  }) =>
      AppStyles(
        customStyle: customStyle,
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

  static AppStyles getAppStyles() => AppStyles.fromTextTheme(
        customStyle: GoogleFonts.inter(
          fontSize: 50.sp,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        ),
        textTheme: GoogleFonts.interTextTheme().copyWith(
          headline1: GoogleFonts.inter(
            fontSize: 50.sp,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
          ),
        ),
      );

  TextTheme getThemeData() => getAppStyles();
}
