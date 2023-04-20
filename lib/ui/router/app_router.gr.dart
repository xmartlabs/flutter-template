// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticatedSectionRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticatedSectionRouter(),
      );
    },
    UnauthenticatedSectionRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UnauthenticatedSectionRouter(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
    SignInScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthenticatedSectionRouter]
class AuthenticatedSectionRouterRoute extends PageRouteInfo<void> {
  const AuthenticatedSectionRouterRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticatedSectionRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedSectionRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UnauthenticatedSectionRouter]
class UnauthenticatedSectionRouterRoute extends PageRouteInfo<void> {
  const UnauthenticatedSectionRouterRoute({List<PageRouteInfo>? children})
      : super(
          UnauthenticatedSectionRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedSectionRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeScreen]
class WelcomeScreenRoute extends PageRouteInfo<void> {
  const WelcomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInScreenRoute extends PageRouteInfo<void> {
  const SignInScreenRoute({List<PageRouteInfo>? children})
      : super(
          SignInScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
