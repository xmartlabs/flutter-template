import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/router/app_router.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.brandColor,
    required this.danger,
  });

  final Color? brandColor;
  final Color? danger;

  @override
  MyColors copyWith({Color? brandColor, Color? danger}) => MyColors(
        brandColor: brandColor ?? this.brandColor,
        danger: danger ?? this.danger,
      );

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}

extension ThemeDataExtensions on ThemeData {
  MyColors get customColors => extension<MyColors>()!;
}
// extension ThemeDataExtensions on ColorScheme {
//      Color? get brandColor => extension<MyColors>()?.brandColor;

// }

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    final MyColors myColors = Theme.of(context).extension<MyColors>()!;

    context.theme.customColors.brandColor;

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
