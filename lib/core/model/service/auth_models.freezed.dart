// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return _SignInResponse.fromJson(json);
}

/// @nodoc
mixin _$SignInResponse {
  String get accessToken => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

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
  $Res call({String accessToken, User user});

  $UserCopyWith<$Res> get user;
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
    Object? accessToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_SignInResponseCopyWith<$Res>
    implements $SignInResponseCopyWith<$Res> {
  factory _$$_SignInResponseCopyWith(
          _$_SignInResponse value, $Res Function(_$_SignInResponse) then) =
      __$$_SignInResponseCopyWithImpl<$Res>;
  @override
  $Res call({String accessToken, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_SignInResponseCopyWithImpl<$Res>
    extends _$SignInResponseCopyWithImpl<$Res>
    implements _$$_SignInResponseCopyWith<$Res> {
  __$$_SignInResponseCopyWithImpl(
      _$_SignInResponse _value, $Res Function(_$_SignInResponse) _then)
      : super(_value, (v) => _then(v as _$_SignInResponse));

  @override
  _$_SignInResponse get _value => super._value as _$_SignInResponse;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_SignInResponse(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SignInResponse implements _SignInResponse {
  _$_SignInResponse({required this.accessToken, required this.user});

  factory _$_SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SignInResponseFromJson(json);

  @override
  final String accessToken;
  @override
  final User user;

  @override
  String toString() {
    return 'SignInResponse(accessToken: $accessToken, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInResponse &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_SignInResponseCopyWith<_$_SignInResponse> get copyWith =>
      __$$_SignInResponseCopyWithImpl<_$_SignInResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInResponseToJson(
      this,
    );
  }
}

abstract class _SignInResponse implements SignInResponse {
  factory _SignInResponse(
      {required final String accessToken,
      required final User user}) = _$_SignInResponse;

  factory _SignInResponse.fromJson(Map<String, dynamic> json) =
      _$_SignInResponse.fromJson;

  @override
  String get accessToken;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_SignInResponseCopyWith<_$_SignInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  return _SignInRequest.fromJson(json);
}

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
abstract class _$$_SignInRequestCopyWith<$Res>
    implements $SignInRequestCopyWith<$Res> {
  factory _$$_SignInRequestCopyWith(
          _$_SignInRequest value, $Res Function(_$_SignInRequest) then) =
      __$$_SignInRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class __$$_SignInRequestCopyWithImpl<$Res>
    extends _$SignInRequestCopyWithImpl<$Res>
    implements _$$_SignInRequestCopyWith<$Res> {
  __$$_SignInRequestCopyWithImpl(
      _$_SignInRequest _value, $Res Function(_$_SignInRequest) _then)
      : super(_value, (v) => _then(v as _$_SignInRequest));

  @override
  _$_SignInRequest get _value => super._value as _$_SignInRequest;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_SignInRequest(
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

@JsonSerializable()
class _$_SignInRequest implements _SignInRequest {
  _$_SignInRequest(
      {@JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'password') required this.password});

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
            other is _$_SignInRequest &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_SignInRequestCopyWith<_$_SignInRequest> get copyWith =>
      __$$_SignInRequestCopyWithImpl<_$_SignInRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInRequestToJson(
      this,
    );
  }
}

abstract class _SignInRequest implements SignInRequest {
  factory _SignInRequest(
          {@JsonKey(name: 'email') required final String email,
          @JsonKey(name: 'password') required final String password}) =
      _$_SignInRequest;

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
  _$$_SignInRequestCopyWith<_$_SignInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
