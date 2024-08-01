import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
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
  final String? initialRoute;

  ReevaluateListenable authReevaluateListenable;

  AppRouter({required SessionRepository sessionRepository, this.initialRoute})
      : authReevaluateListenable = ReevaluateListenable.stream(
          sessionRepository.status.distinct().skip(1),
        ),
        routes = [
          AutoRoute(
            page: UnauthenticatedSectionRoute.page,
            path: '/',
            guards: [UnauthenticatedGuard(sessionRepository)],
            children: [
              RedirectRoute(path: '', redirectTo: initialRoute ?? 'login'),
              AutoRoute(path: 'login', page: SignInRoute.page),
            ],
          ),
          AutoRoute(
            page: AuthenticatedSectionRoute.page,
            guards: [AuthenticatedGuard(sessionRepository)],
            path: '/',
            children: [
              RedirectRoute(path: '', redirectTo: initialRoute ?? 'welcome'),
              AutoRoute(path: 'welcome', page: WelcomeRoute.page),
            ],
          ),
        ];
}
