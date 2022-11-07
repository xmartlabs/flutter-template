import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
      children: [
        AutoRoute(
          path: AppRouter.signInPath,
          page: SignInScreen,
          initial: true,
        ),
      ],
    ),
    AutoRoute(
      name: 'AuthenticatedRouter',
      page: SectionRouter,
      children: [
        AutoRoute(
          path: AppRouter.welcomePath,
          page: WelcomeScreen,
          initial: true,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  static const signInPath = 'signin';
  static const welcomePath = 'welcome';
}
