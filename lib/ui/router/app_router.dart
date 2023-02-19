import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/router/app_status_router_guards.dart';
import 'package:flutter_template/ui/section/section_router.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      name: 'UnauthenticatedRouter',
      page: SectionRouter,
      initial: true,
      guards: [UnauthenticatedGuard],
      children: [
        AutoRoute(
          path: 'login',
          page: SignInScreen,
          initial: true,
        ),
      ],
    ),
    AutoRoute(
      name: 'AuthenticatedRouter',
      page: SectionRouter,
      guards: [AuthenticatedGuard],
      children: [
        AutoRoute(
          path: 'welcome',
          page: WelcomeScreen,
          initial: true,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(
    UnauthenticatedGuard unauthenticatedGuard,
    AuthenticatedGuard authenticatedGuard,
  ) : super(
          unauthenticatedGuard: unauthenticatedGuard,
          authenticatedGuard: authenticatedGuard,
        );
}
