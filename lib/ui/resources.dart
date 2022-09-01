import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class Resources {
  static late AppLocalizations localizations;

  static late ThemeData theme;

  static void setup(BuildContext appContext) {
    localizations = AppLocalizations.of(appContext)!;
    theme = Theme.of(appContext);
  }
}
