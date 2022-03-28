import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/ui/app_router.dart';
import 'package:flutter_template/ui/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(),
      child: _SplashContentScreen(),
    );
  }
}

class _SplashContentScreen extends StatelessWidget {
  final router = DiProvider.get<AppRouter>();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SplashBloc, SplashBaseState>(builder: (context, state) {
        return MaterialApp.router(
          routerDelegate: AutoRouterDelegate.declarative(
            router,
            routes: (_) => provideRoutes(state),
          ),
          routeInformationParser:
              router.defaultRouteParser(includePrefixMatches: true),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        );
      });

  List<PageRouteInfo<dynamic>> provideRoutes(SplashBaseState state) {
    switch (state.authenticationStatus) {
      case AuthenticationStatus.unknown:
        return [];
      case AuthenticationStatus.authenticated:
        return [WelcomeScreenRoute()];
      case AuthenticationStatus.unauthenticated:
        return [SignInScreenRoute()];
    }
  }
}
