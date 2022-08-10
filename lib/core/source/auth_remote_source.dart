import 'package:flutter_template/core/model/service/auth_models.dart';
import 'package:flutter_template/core/model/service/service_response.dart';
import 'package:flutter_template/core/source/common/http_service.dart';

class AuthRemoteSource {
  final HttpServiceDio _httpService;

  static const _urlLogin = 'user/login';

  AuthRemoteSource(this._httpService);

  Future<SignInResponse> signIn(String email, String password) async =>
      (await _httpService.postAndProcessResponse(
        _urlLogin,
        data: SignInRequest(email: email, password: password).toJson(),
        serializer: (data) => SignInResponse.fromJson(data),
      ))
          .getDataOrThrow();
}
