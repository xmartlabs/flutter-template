import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
