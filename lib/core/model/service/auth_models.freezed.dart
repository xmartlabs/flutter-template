// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return _SignInResponse.fromJson(json);
}

/// @nodoc
class _$SignInResponseTearOff {
  const _$SignInResponseTearOff();

  _SignInResponse call(String token, String name, String email) {
    return _SignInResponse(
      token,
      name,
      email,
    );
  }

  SignInResponse fromJson(Map<String, Object?> json) {
    return SignInResponse.fromJson(json);
  }
}

/// @nodoc
const $SignInResponse = _$SignInResponseTearOff();

/// @nodoc
mixin _$SignInResponse {
  String get token => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInResponseCopyWith<SignInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseCopyWith<$Res> {
  factory $SignInResponseCopyWith(
          SignInResponse value, $Res Function(SignInResponse) then) =
      _$SignInResponseCopyWithImpl<$Res>;
  $Res call({String token, String name, String email});
}

/// @nodoc
class _$SignInResponseCopyWithImpl<$Res>
    implements $SignInResponseCopyWith<$Res> {
  _$SignInResponseCopyWithImpl(this._value, this._then);

  final SignInResponse _value;
  // ignore: unused_field
  final $Res Function(SignInResponse) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignInResponseCopyWith<$Res>
    implements $SignInResponseCopyWith<$Res> {
  factory _$SignInResponseCopyWith(
          _SignInResponse value, $Res Function(_SignInResponse) then) =
      __$SignInResponseCopyWithImpl<$Res>;
  @override
  $Res call({String token, String name, String email});
}

/// @nodoc
class __$SignInResponseCopyWithImpl<$Res>
    extends _$SignInResponseCopyWithImpl<$Res>
    implements _$SignInResponseCopyWith<$Res> {
  __$SignInResponseCopyWithImpl(
      _SignInResponse _value, $Res Function(_SignInResponse) _then)
      : super(_value, (v) => _then(v as _SignInResponse));

  @override
  _SignInResponse get _value => super._value as _SignInResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_SignInResponse(
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$_SignInResponse implements _SignInResponse {
  _$_SignInResponse(this.token, this.name, this.email);

  factory _$_SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SignInResponseFromJson(json);

  @override
  final String token;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'SignInResponse(token: $token, name: $name, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInResponse &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$SignInResponseCopyWith<_SignInResponse> get copyWith =>
      __$SignInResponseCopyWithImpl<_SignInResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInResponseToJson(this);
  }
}

abstract class _SignInResponse implements SignInResponse {
  factory _SignInResponse(String token, String name, String email) =
      _$_SignInResponse;

  factory _SignInResponse.fromJson(Map<String, dynamic> json) =
      _$_SignInResponse.fromJson;

  @override
  String get token;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$SignInResponseCopyWith<_SignInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  return _SignInRequest.fromJson(json);
}

/// @nodoc
class _$SignInRequestTearOff {
  const _$SignInRequestTearOff();

  _SignInRequest call(@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password) {
    return _SignInRequest(
      email,
      password,
    );
  }

  SignInRequest fromJson(Map<String, Object?> json) {
    return SignInRequest.fromJson(json);
  }
}

/// @nodoc
const $SignInRequest = _$SignInRequestTearOff();

/// @nodoc
mixin _$SignInRequest {
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInRequestCopyWith<SignInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRequestCopyWith<$Res> {
  factory $SignInRequestCopyWith(
          SignInRequest value, $Res Function(SignInRequest) then) =
      _$SignInRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class _$SignInRequestCopyWithImpl<$Res>
    implements $SignInRequestCopyWith<$Res> {
  _$SignInRequestCopyWithImpl(this._value, this._then);

  final SignInRequest _value;
  // ignore: unused_field
  final $Res Function(SignInRequest) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignInRequestCopyWith<$Res>
    implements $SignInRequestCopyWith<$Res> {
  factory _$SignInRequestCopyWith(
          _SignInRequest value, $Res Function(_SignInRequest) then) =
      __$SignInRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class __$SignInRequestCopyWithImpl<$Res>
    extends _$SignInRequestCopyWithImpl<$Res>
    implements _$SignInRequestCopyWith<$Res> {
  __$SignInRequestCopyWithImpl(
      _SignInRequest _value, $Res Function(_SignInRequest) _then)
      : super(_value, (v) => _then(v as _SignInRequest));

  @override
  _SignInRequest get _value => super._value as _SignInRequest;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignInRequest(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SignInRequest implements _SignInRequest {
  _$_SignInRequest(@JsonKey(name: 'email') this.email,
      @JsonKey(name: 'password') this.password);

  factory _$_SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SignInRequestFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'SignInRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInRequest &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SignInRequestCopyWith<_SignInRequest> get copyWith =>
      __$SignInRequestCopyWithImpl<_SignInRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInRequestToJson(this);
  }
}

abstract class _SignInRequest implements SignInRequest {
  factory _SignInRequest(@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password) = _$_SignInRequest;

  factory _SignInRequest.fromJson(Map<String, dynamic> json) =
      _$_SignInRequest.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignInRequestCopyWith<_SignInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
