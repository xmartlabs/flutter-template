import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/router/app_router.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
