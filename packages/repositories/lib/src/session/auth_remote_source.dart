import 'package:repositories/src/session/common/auth_models.dart';
import 'package:services/networking.dart';

class AuthRemoteSource {
  final HttpServiceDio _httpService;

  static const _urlLogin = 'auth/v1/token';

  AuthRemoteSource(this._httpService);

  Future<SignInResponse> signIn(String email, String password) async =>
      (await _httpService.postAndProcessResponse(
        _urlLogin,
        queryParameters: {'grant_type': 'password'},
        data: SignInRequest(email: email, password: password).toJson(),
        serializer: (data) => SignInResponse.fromJson(data),
      ))
          .getDataOrThrow();
}
