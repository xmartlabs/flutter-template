import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles extends TextTheme {
  final TextStyle customStyle;

  AppStyles({
    required this.customStyle,
    headline1,
    headline2,
    headline3,
    headline4,
    headline5,
    headline6,
    bodyLarge,
    bodyMedium,
    bodySmall,
    bodyText1,
    bodyText2,
    caption,
    overline,
  });

  factory AppStyles.fromTextTheme({
    required TextStyle customStyle,
    required TextTheme textTheme,
  }) =>
      AppStyles(
        customStyle: customStyle,
        headline1: textTheme.headline1,
        headline2: textTheme.headline2,
        headline3: textTheme.headline3,
        headline4: textTheme.headline4,
        headline5: textTheme.headline5,
        headline6: textTheme.headline6,
        bodyLarge: textTheme.bodyLarge,
        bodyMedium: textTheme.bodyMedium,
        bodySmall: textTheme.bodySmall,
        bodyText1: textTheme.bodyText1,
        bodyText2: textTheme.bodyText2,
        caption: textTheme.caption,
        overline: textTheme.overline,
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
