import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/common/extension/stream_future_extensions.dart';
import 'package:flutter_template/core/di/di_provider.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/section/error_handler/cubit/global_event_handler_cubit.dart';

class SignInProvider extends ChangeNotifier {
  String email = 'hi@xmartlabs.com';
  String password = 'xmartlabs';
  String error = '';
  final GlobalEventHandler _globalEventHandler;
  final SessionRepository _sessionRepository = DiProvider.get();

  SignInProvider(this._globalEventHandler);

  void changeEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void changePassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future<void> signIn() => _sessionRepository
      .signInUser(email: email, password: password)
      .filterSuccess(_globalEventHandler.handleError);
}
