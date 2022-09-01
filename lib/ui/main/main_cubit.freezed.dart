// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainBaseState {
  AuthenticationStatus? get authenticationStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticationStatus? authenticationStatus) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStatus? authenticationStatus)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticationStatus? authenticationStatus)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainBaseStateCopyWith<MainBaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBaseStateCopyWith<$Res> {
  factory $MainBaseStateCopyWith(
          MainBaseState value, $Res Function(MainBaseState) then) =
      _$MainBaseStateCopyWithImpl<$Res>;
  $Res call({AuthenticationStatus? authenticationStatus});
}

/// @nodoc
class _$MainBaseStateCopyWithImpl<$Res>
    implements $MainBaseStateCopyWith<$Res> {
  _$MainBaseStateCopyWithImpl(this._value, this._then);

  final MainBaseState _value;
  // ignore: unused_field
  final $Res Function(MainBaseState) _then;

  @override
  $Res call({
    Object? authenticationStatus = freezed,
  }) {
    return _then(_value.copyWith(
      authenticationStatus: authenticationStatus == freezed
          ? _value.authenticationStatus
          : authenticationStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus?,
    ));
  }
}

/// @nodoc
abstract class _$$_MainStateCopyWith<$Res>
    implements $MainBaseStateCopyWith<$Res> {
  factory _$$_MainStateCopyWith(
          _$_MainState value, $Res Function(_$_MainState) then) =
      __$$_MainStateCopyWithImpl<$Res>;
  @override
  $Res call({AuthenticationStatus? authenticationStatus});
}

/// @nodoc
class __$$_MainStateCopyWithImpl<$Res> extends _$MainBaseStateCopyWithImpl<$Res>
    implements _$$_MainStateCopyWith<$Res> {
  __$$_MainStateCopyWithImpl(
      _$_MainState _value, $Res Function(_$_MainState) _then)
      : super(_value, (v) => _then(v as _$_MainState));

  @override
  _$_MainState get _value => super._value as _$_MainState;

  @override
  $Res call({
    Object? authenticationStatus = freezed,
  }) {
    return _then(_$_MainState(
      authenticationStatus: authenticationStatus == freezed
          ? _value.authenticationStatus
          : authenticationStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus?,
    ));
  }
}

/// @nodoc

class _$_MainState implements _MainState {
  const _$_MainState({this.authenticationStatus = null});

  @override
  @JsonKey()
  final AuthenticationStatus? authenticationStatus;

  @override
  String toString() {
    return 'MainBaseState.state(authenticationStatus: $authenticationStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainState &&
            const DeepCollectionEquality()
                .equals(other.authenticationStatus, authenticationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(authenticationStatus));

  @JsonKey(ignore: true)
  @override
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      __$$_MainStateCopyWithImpl<_$_MainState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticationStatus? authenticationStatus) state,
  }) {
    return state(authenticationStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStatus? authenticationStatus)? state,
  }) {
    return state?.call(authenticationStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticationStatus? authenticationStatus)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(authenticationStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MainState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _MainState implements MainBaseState {
  const factory _MainState({final AuthenticationStatus? authenticationStatus}) =
      _$_MainState;

  @override
  AuthenticationStatus? get authenticationStatus;
  @override
  @JsonKey(ignore: true)
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      throw _privateConstructorUsedError;
}
