import 'package:design_system/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/router/app_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = DiProvider.get<AppRouter>();
    return MaterialApp.router(
      theme: AppTheme.provideAppTheme(context),
      routerConfig:
          router.config(reevaluateListenable: router.authReevaluateListenable),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        Resources.setup(context);
        return child!;
      },
    );
  }
}
