import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/ui/extensions/context_extensions.dart';

abstract class Resources {
  /// Returns the app localizations
  /// It should be used only in spacial cases when the context is not available
  /// It's recommended to use `context.localizations` extension method.
  /// This property doesn't notify the widget if the language changes,
  /// so if the language changes or the localization are load async,
  /// the app language will not be consistent.
  static late AppLocalizations localizations;

  static void setup(BuildContext appContext) {
    localizations = appContext.localizations;
  }
}
