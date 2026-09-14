// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    _SignInResponse(
      accessToken: json['access_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(_SignInResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user': instance.user.toJson(),
    };

_SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    _SignInRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInRequestToJson(_SignInRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
