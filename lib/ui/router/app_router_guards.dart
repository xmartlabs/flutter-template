import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/router/app_router.dart';

class _AppAuthStatusGuard extends AutoRouteGuard {
  final SessionRepository _sessionRepository;
  final AuthenticationStatus _requiredAppStatus;
  final PageRouteInfo _redirectPage;

  _AppAuthStatusGuard({
    required SessionRepository sessionRepository,
    required AuthenticationStatus requiredAppStatus,
    required PageRouteInfo redirectPage,
  })  : _sessionRepository = sessionRepository,
        _requiredAppStatus = requiredAppStatus,
        _redirectPage = redirectPage;

  Future<bool> _canNavigate(RouteMatch route) => _sessionRepository.status.first
      .then((value) => value == _requiredAppStatus);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (await _canNavigate(resolver.route)) {
      resolver.resolveNext(true);
    } else {
      unawaited(resolver.redirect(_redirectPage, replace: true));
      resolver.next(false);
    }
  }
}

class UnauthenticatedGuard extends _AppAuthStatusGuard {
  UnauthenticatedGuard(SessionRepository sessionRepository)
      : super(
          requiredAppStatus: AuthenticationStatus.unauthenticated,
          redirectPage: const AuthenticatedSectionRoute(),
          sessionRepository: sessionRepository,
        );
}

class AuthenticatedGuard extends _AppAuthStatusGuard {
  AuthenticatedGuard(SessionRepository sessionRepository)
      : super(
          requiredAppStatus: AuthenticationStatus.authenticated,
          redirectPage: const UnauthenticatedSectionRoute(),
          sessionRepository: sessionRepository,
        );
}
