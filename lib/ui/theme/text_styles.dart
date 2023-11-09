import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles extends TextTheme {
  final TextStyle customStyle;

  const AppStyles({
    required this.customStyle,
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
          bodyLarge: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
          ),
        ),
      );

  TextTheme getThemeData() => getAppStyles();
}
