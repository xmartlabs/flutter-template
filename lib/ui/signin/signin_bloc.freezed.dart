// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) changeEmail,
    required TResult Function(String password) changePassword,
    required TResult Function() login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeEmailSignInEvent value) changeEmail,
    required TResult Function(ChangePasswordSignInEvent value) changePassword,
    required TResult Function(LoginSignInEvent value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res> implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  final SignInEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEvent) _then;
}

/// @nodoc
abstract class $ChangeEmailSignInEventCopyWith<$Res> {
  factory $ChangeEmailSignInEventCopyWith(ChangeEmailSignInEvent value,
          $Res Function(ChangeEmailSignInEvent) then) =
      _$ChangeEmailSignInEventCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$ChangeEmailSignInEventCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements $ChangeEmailSignInEventCopyWith<$Res> {
  _$ChangeEmailSignInEventCopyWithImpl(ChangeEmailSignInEvent _value,
      $Res Function(ChangeEmailSignInEvent) _then)
      : super(_value, (v) => _then(v as ChangeEmailSignInEvent));

  @override
  ChangeEmailSignInEvent get _value => super._value as ChangeEmailSignInEvent;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(ChangeEmailSignInEvent(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeEmailSignInEvent implements ChangeEmailSignInEvent {
  const _$ChangeEmailSignInEvent({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'SignInEvent.changeEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeEmailSignInEvent &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  $ChangeEmailSignInEventCopyWith<ChangeEmailSignInEvent> get copyWith =>
      _$ChangeEmailSignInEventCopyWithImpl<ChangeEmailSignInEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) changeEmail,
    required TResult Function(String password) changePassword,
    required TResult Function() login,
  }) {
    return changeEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
  }) {
    return changeEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
    required TResult orElse(),
  }) {
    if (changeEmail != null) {
      return changeEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeEmailSignInEvent value) changeEmail,
    required TResult Function(ChangePasswordSignInEvent value) changePassword,
    required TResult Function(LoginSignInEvent value) login,
  }) {
    return changeEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
  }) {
    return changeEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
    required TResult orElse(),
  }) {
    if (changeEmail != null) {
      return changeEmail(this);
    }
    return orElse();
  }
}

abstract class ChangeEmailSignInEvent implements SignInEvent {
  const factory ChangeEmailSignInEvent({required final String email}) =
      _$ChangeEmailSignInEvent;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeEmailSignInEventCopyWith<ChangeEmailSignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordSignInEventCopyWith<$Res> {
  factory $ChangePasswordSignInEventCopyWith(ChangePasswordSignInEvent value,
          $Res Function(ChangePasswordSignInEvent) then) =
      _$ChangePasswordSignInEventCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$ChangePasswordSignInEventCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements $ChangePasswordSignInEventCopyWith<$Res> {
  _$ChangePasswordSignInEventCopyWithImpl(ChangePasswordSignInEvent _value,
      $Res Function(ChangePasswordSignInEvent) _then)
      : super(_value, (v) => _then(v as ChangePasswordSignInEvent));

  @override
  ChangePasswordSignInEvent get _value =>
      super._value as ChangePasswordSignInEvent;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(ChangePasswordSignInEvent(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordSignInEvent implements ChangePasswordSignInEvent {
  const _$ChangePasswordSignInEvent({required this.password});

  @override
  final String password;

  @override
  String toString() {
    return 'SignInEvent.changePassword(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangePasswordSignInEvent &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  $ChangePasswordSignInEventCopyWith<ChangePasswordSignInEvent> get copyWith =>
      _$ChangePasswordSignInEventCopyWithImpl<ChangePasswordSignInEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) changeEmail,
    required TResult Function(String password) changePassword,
    required TResult Function() login,
  }) {
    return changePassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
  }) {
    return changePassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeEmailSignInEvent value) changeEmail,
    required TResult Function(ChangePasswordSignInEvent value) changePassword,
    required TResult Function(LoginSignInEvent value) login,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePasswordSignInEvent implements SignInEvent {
  const factory ChangePasswordSignInEvent({required final String password}) =
      _$ChangePasswordSignInEvent;

  String get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordSignInEventCopyWith<ChangePasswordSignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginSignInEventCopyWith<$Res> {
  factory $LoginSignInEventCopyWith(
          LoginSignInEvent value, $Res Function(LoginSignInEvent) then) =
      _$LoginSignInEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginSignInEventCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements $LoginSignInEventCopyWith<$Res> {
  _$LoginSignInEventCopyWithImpl(
      LoginSignInEvent _value, $Res Function(LoginSignInEvent) _then)
      : super(_value, (v) => _then(v as LoginSignInEvent));

  @override
  LoginSignInEvent get _value => super._value as LoginSignInEvent;
}

/// @nodoc

class _$LoginSignInEvent implements LoginSignInEvent {
  const _$LoginSignInEvent();

  @override
  String toString() {
    return 'SignInEvent.login()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginSignInEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) changeEmail,
    required TResult Function(String password) changePassword,
    required TResult Function() login,
  }) {
    return login();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
  }) {
    return login?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? changeEmail,
    TResult Function(String password)? changePassword,
    TResult Function()? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeEmailSignInEvent value) changeEmail,
    required TResult Function(ChangePasswordSignInEvent value) changePassword,
    required TResult Function(LoginSignInEvent value) login,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeEmailSignInEvent value)? changeEmail,
    TResult Function(ChangePasswordSignInEvent value)? changePassword,
    TResult Function(LoginSignInEvent value)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class LoginSignInEvent implements SignInEvent {
  const factory LoginSignInEvent() = _$LoginSignInEvent;
}

/// @nodoc
mixin _$SignInBaseState {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email, String? password, String error)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email, String? password, String error)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email, String? password, String error)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInBaseStateCopyWith<SignInBaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInBaseStateCopyWith<$Res> {
  factory $SignInBaseStateCopyWith(
          SignInBaseState value, $Res Function(SignInBaseState) then) =
      _$SignInBaseStateCopyWithImpl<$Res>;
  $Res call({String? email, String? password, String error});
}

/// @nodoc
class _$SignInBaseStateCopyWithImpl<$Res>
    implements $SignInBaseStateCopyWith<$Res> {
  _$SignInBaseStateCopyWithImpl(this._value, this._then);

  final SignInBaseState _value;
  // ignore: unused_field
  final $Res Function(SignInBaseState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res>
    implements $SignInBaseStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
  @override
  $Res call({String? email, String? password, String error});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res>
    extends _$SignInBaseStateCopyWithImpl<$Res>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(
      SignInState _value, $Res Function(SignInState) _then)
      : super(_value, (v) => _then(v as SignInState));

  @override
  SignInState get _value => super._value as SignInState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? error = freezed,
  }) {
    return _then(SignInState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInState implements SignInState {
  const _$SignInState(
      {required this.email, required this.password, required this.error});

  @override
  final String? email;
  @override
  final String? password;
  @override
  final String error;

  @override
  String toString() {
    return 'SignInBaseState.state(email: $email, password: $password, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $SignInStateCopyWith<SignInState> get copyWith =>
      _$SignInStateCopyWithImpl<SignInState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email, String? password, String error)
        state,
  }) {
    return state(email, password, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email, String? password, String error)? state,
  }) {
    return state?.call(email, password, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email, String? password, String error)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(email, password, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class SignInState implements SignInBaseState {
  const factory SignInState(
      {required final String? email,
      required final String? password,
      required final String error}) = _$SignInState;

  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}
