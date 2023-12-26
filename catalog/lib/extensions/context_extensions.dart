import 'package:catalog/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:catalog/theme/app_buttons.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppButtonsStyle get buttonsStyle => AppButtonsStyle.getButtonTheme(
        theme.customColors,
        theme.customTextStyles,
        theme.colorScheme,
      );
}
