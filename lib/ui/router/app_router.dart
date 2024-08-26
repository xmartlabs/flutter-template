import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/ui/router/app_router_guards.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (BuildContext context, GoRouterState state) =>
          const WelcomeScreen(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final authState = AuthenticationScope.of(context);
    if (authState == AuthenticationStatus.unauthenticated) {
      return '/';
    } else {
      return '/welcome';
    }
  },
);
