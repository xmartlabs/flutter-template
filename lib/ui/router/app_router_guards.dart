import 'package:flutter/cupertino.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/model/authentication_status.dart';
import 'package:flutter_template/core/repository/session_repository.dart';

class AuthenticationScope extends InheritedNotifier<StreamAuthNotifier> {
  /// Creates a [AuthenticationScope] sign in scope.
  AuthenticationScope({
    required super.child,
    super.key,
  }) : super(
          notifier: StreamAuthNotifier(),
        );

  /// Gets the [StreamAuth].
  static AuthenticationStatus? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<AuthenticationScope>()!
      .notifier!
      .authenticationStatus;
}

class StreamAuthNotifier extends ChangeNotifier {
  final SessionRepository _sessionRepository = DiProvider.get();

  /// Creates a [StreamAuthNotifier].
  StreamAuthNotifier() {
    _sessionRepository.status.listen((event) {
      authenticationStatus = event;
      notifyListeners();
    });
  }

  AuthenticationStatus? authenticationStatus;
}
