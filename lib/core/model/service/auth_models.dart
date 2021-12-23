import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';

part 'auth_models.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory SignInResponse(String token, String name, String email) =
      _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}

@freezed
class SignInRequest with _$SignInRequest {
  @JsonSerializable()
  factory SignInRequest(@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
