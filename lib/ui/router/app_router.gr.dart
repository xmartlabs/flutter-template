// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.unauthenticatedGuard,
    required this.authenticatedGuard,
  }) : super(navigatorKey);

  final UnauthenticatedGuard unauthenticatedGuard;

  final AuthenticatedGuard authenticatedGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    UnauthenticatedRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SectionRouter(),
      );
    },
    AuthenticatedRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SectionRouter(),
      );
    },
    SignInScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          UnauthenticatedRouter.name,
          path: '/',
          guards: [unauthenticatedGuard],
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: UnauthenticatedRouter.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            RouteConfig(
              SignInScreenRoute.name,
              path: 'login',
              parent: UnauthenticatedRouter.name,
            ),
          ],
        ),
        RouteConfig(
          AuthenticatedRouter.name,
          path: '/section-router',
          guards: [authenticatedGuard],
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: AuthenticatedRouter.name,
              redirectTo: 'welcome',
              fullMatch: true,
            ),
            RouteConfig(
              WelcomeScreenRoute.name,
              path: 'welcome',
              parent: AuthenticatedRouter.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SectionRouter]
class UnauthenticatedRouter extends PageRouteInfo<void> {
  const UnauthenticatedRouter({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedRouter';
}

/// generated route for
/// [SectionRouter]
class AuthenticatedRouter extends PageRouteInfo<void> {
  const AuthenticatedRouter({List<PageRouteInfo>? children})
      : super(
          AuthenticatedRouter.name,
          path: '/section-router',
          initialChildren: children,
        );

  static const String name = 'AuthenticatedRouter';
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(
          SignInScreenRoute.name,
          path: 'login',
        );

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [WelcomeScreen]
class WelcomeScreenRoute extends PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(
          WelcomeScreenRoute.name,
          path: 'welcome',
        );

  static const String name = 'WelcomeScreenRoute';
}