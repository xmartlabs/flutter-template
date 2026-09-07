import 'package:flutter_template/core/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';

part 'auth_models.g.dart';

@freezed
abstract class SignInResponse with _$SignInResponse {
  @JsonSerializable()
  factory SignInResponse({required String accessToken, required User user}) =
      _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}

@freezed
abstract class SignInRequest with _$SignInRequest {
  @JsonSerializable()
  factory SignInRequest({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
