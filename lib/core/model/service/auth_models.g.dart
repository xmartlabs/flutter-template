// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInResponse _$$_SignInResponseFromJson(Map<String, dynamic> json) =>
    _$_SignInResponse(
      json['Token'] as String,
      json['Name'] as String,
      json['Email'] as String,
    );

Map<String, dynamic> _$$_SignInResponseToJson(_$_SignInResponse instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'Name': instance.name,
      'Email': instance.email,
    };

_$_SignInRequest _$$_SignInRequestFromJson(Map<String, dynamic> json) =>
    _$_SignInRequest(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$$_SignInRequestToJson(_$_SignInRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
