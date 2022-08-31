// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInResponse _$$_SignInResponseFromJson(Map<String, dynamic> json) =>
    _$_SignInResponse(
      accessToken: json['access_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SignInResponseToJson(_$_SignInResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user': instance.user.toJson(),
    };

_$_SignInRequest _$$_SignInRequestFromJson(Map<String, dynamic> json) =>
    _$_SignInRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_SignInRequestToJson(_$_SignInRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
