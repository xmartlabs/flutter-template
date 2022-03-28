import 'package:flutter_template/core/model/service/auth_models.dart';
import 'package:flutter_template/core/source/common/http_service.dart';

class AuthRemoteSource {
  final HttpServiceDio _httpService;

  static const _URL_LOGIN = 'authaccount/login';

  AuthRemoteSource(this._httpService);

  Future<SignInResponse> signIn(String email, String password) async =>
      (await _httpService.postAndProcessResponse(
        _URL_LOGIN,
        data: SignInRequest(email: email, password: password).toJson(),
        serializer: SignInResponse.fromJson,
      ))
          .getDataOrThrow();
}
