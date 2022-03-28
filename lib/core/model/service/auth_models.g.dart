// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInResponse _$$_SignInResponseFromJson(Map<String, dynamic> json) =>
    _$_SignInResponse(
      token: json['Token'] as String,
      name: json['Name'] as String,
      email: json['Email'] as String,
    );

Map<String, dynamic> _$$_SignInResponseToJson(_$_SignInResponse instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'Name': instance.name,
      'Email': instance.email,
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
