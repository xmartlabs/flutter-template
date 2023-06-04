import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/ui/router/app_router_guards.dart';
import 'package:flutter_template/ui/section/section_router.dart';
import 'package:flutter_template/ui/signin/signin_screen.dart';
import 'package:flutter_template/ui/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|Router,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes;

  AppRouter(
    UnauthenticatedGuard unauthenticatedGuard,
    AuthenticatedGuard authenticatedGuard,
  ) : routes = [
          AutoRoute(
            page: UnauthenticatedSectionRoute.page,
            path: '/',
            guards: [unauthenticatedGuard],
            children: [
              RedirectRoute(path: '', redirectTo: 'login'),
              AutoRoute(path: 'login', page: SignInRoute.page),
            ],
          ),
          AutoRoute(
            page: AuthenticatedSectionRoute.page,
            guards: [authenticatedGuard],
            path: '/',
            children: [
              RedirectRoute(path: '', redirectTo: 'welcome'),
              AutoRoute(path: 'welcome', page: WelcomeRoute.page),
            ],
          ),
        ];
}
