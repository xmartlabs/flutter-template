import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/ui/app_router.dart';
import 'package:flutter_template/ui/main/main_cubit.dart';
import 'package:flutter_template/ui/resources.dart';
import 'package:flutter_template/ui/theme/app_theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: _SplashContentScreen(),
    );
  }
}

class _SplashContentScreen extends StatelessWidget {
  final router = DiProvider.get<AppRouter>();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MainCubit, MainBaseState>(builder: (context, state) {
        return MaterialApp.router(
          theme: AppTheme.provideAppTheme(context),
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
          builder: (context, child) {
            Resources.setup(context);
            return child!;
          },
        );
      });

  List<PageRouteInfo<dynamic>> provideRoutes(MainBaseState state) {
    switch (state.authenticationStatus) {
      case AuthenticationStatus.authenticated:
        return [AuthenticatedRouter()];
      case AuthenticationStatus.unauthenticated:
        return [UnauthenticatedRouter()];
      case null:
        return [];
    }
  }
}
