import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_template/ui/splash/splash_screen.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(path: AppRouter.SIGN_IN_PATH, page: SignInScreen),
    AutoRoute(path: AppRouter.WELCOME_PATH, page: WelcomeScreen),
  ],
)
class AppRouter extends _$AppRouter {
  static const SIGN_IN_PATH = '/signin';
  static const WELCOME_PATH = '/welcome';
}
