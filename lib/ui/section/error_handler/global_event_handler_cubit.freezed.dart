// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_event_handler_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GlobalEventHandlerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(GlobalEventHandlerStateError error) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(GlobalEventHandlerStateError error)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(GlobalEventHandlerStateError error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleGlobalEventHandlerState value) idle,
    required TResult Function(ErrorGlobalEventHandlerState value) error,
    required TResult Function(LoadingGlobalEventHandlerState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleGlobalEventHandlerState value)? idle,
    TResult? Function(ErrorGlobalEventHandlerState value)? error,
    TResult? Function(LoadingGlobalEventHandlerState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleGlobalEventHandlerState value)? idle,
    TResult Function(ErrorGlobalEventHandlerState value)? error,
    TResult Function(LoadingGlobalEventHandlerState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalEventHandlerStateCopyWith<$Res> {
  factory $GlobalEventHandlerStateCopyWith(GlobalEventHandlerState value,
          $Res Function(GlobalEventHandlerState) then) =
      _$GlobalEventHandlerStateCopyWithImpl<$Res, GlobalEventHandlerState>;
}

/// @nodoc
class _$GlobalEventHandlerStateCopyWithImpl<$Res,
        $Val extends GlobalEventHandlerState>
    implements $GlobalEventHandlerStateCopyWith<$Res> {
  _$GlobalEventHandlerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleGlobalEventHandlerStateCopyWith<$Res> {
  factory _$$IdleGlobalEventHandlerStateCopyWith(
          _$IdleGlobalEventHandlerState value,
          $Res Function(_$IdleGlobalEventHandlerState) then) =
      __$$IdleGlobalEventHandlerStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleGlobalEventHandlerStateCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateCopyWithImpl<$Res,
        _$IdleGlobalEventHandlerState>
    implements _$$IdleGlobalEventHandlerStateCopyWith<$Res> {
  __$$IdleGlobalEventHandlerStateCopyWithImpl(
      _$IdleGlobalEventHandlerState _value,
      $Res Function(_$IdleGlobalEventHandlerState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleGlobalEventHandlerState
    with DiagnosticableTreeMixin
    implements IdleGlobalEventHandlerState {
  const _$IdleGlobalEventHandlerState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalEventHandlerState.idle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GlobalEventHandlerState.idle'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleGlobalEventHandlerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(GlobalEventHandlerStateError error) error,
    required TResult Function() loading,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(GlobalEventHandlerStateError error)? error,
    TResult? Function()? loading,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(GlobalEventHandlerStateError error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleGlobalEventHandlerState value) idle,
    required TResult Function(ErrorGlobalEventHandlerState value) error,
    required TResult Function(LoadingGlobalEventHandlerState value) loading,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleGlobalEventHandlerState value)? idle,
    TResult? Function(ErrorGlobalEventHandlerState value)? error,
    TResult? Function(LoadingGlobalEventHandlerState value)? loading,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleGlobalEventHandlerState value)? idle,
    TResult Function(ErrorGlobalEventHandlerState value)? error,
    TResult Function(LoadingGlobalEventHandlerState value)? loading,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IdleGlobalEventHandlerState implements GlobalEventHandlerState {
  const factory IdleGlobalEventHandlerState() = _$IdleGlobalEventHandlerState;
}

/// @nodoc
abstract class _$$ErrorGlobalEventHandlerStateCopyWith<$Res> {
  factory _$$ErrorGlobalEventHandlerStateCopyWith(
          _$ErrorGlobalEventHandlerState value,
          $Res Function(_$ErrorGlobalEventHandlerState) then) =
      __$$ErrorGlobalEventHandlerStateCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalEventHandlerStateError error});

  $GlobalEventHandlerStateErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorGlobalEventHandlerStateCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateCopyWithImpl<$Res,
        _$ErrorGlobalEventHandlerState>
    implements _$$ErrorGlobalEventHandlerStateCopyWith<$Res> {
  __$$ErrorGlobalEventHandlerStateCopyWithImpl(
      _$ErrorGlobalEventHandlerState _value,
      $Res Function(_$ErrorGlobalEventHandlerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorGlobalEventHandlerState(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as GlobalEventHandlerStateError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GlobalEventHandlerStateErrorCopyWith<$Res> get error {
    return $GlobalEventHandlerStateErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ErrorGlobalEventHandlerState
    with DiagnosticableTreeMixin
    implements ErrorGlobalEventHandlerState {
  const _$ErrorGlobalEventHandlerState(this.error);

  @override
  final GlobalEventHandlerStateError error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalEventHandlerState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GlobalEventHandlerState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorGlobalEventHandlerState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorGlobalEventHandlerStateCopyWith<_$ErrorGlobalEventHandlerState>
      get copyWith => __$$ErrorGlobalEventHandlerStateCopyWithImpl<
          _$ErrorGlobalEventHandlerState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(GlobalEventHandlerStateError error) error,
    required TResult Function() loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(GlobalEventHandlerStateError error)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(GlobalEventHandlerStateError error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleGlobalEventHandlerState value) idle,
    required TResult Function(ErrorGlobalEventHandlerState value) error,
    required TResult Function(LoadingGlobalEventHandlerState value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleGlobalEventHandlerState value)? idle,
    TResult? Function(ErrorGlobalEventHandlerState value)? error,
    TResult? Function(LoadingGlobalEventHandlerState value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleGlobalEventHandlerState value)? idle,
    TResult Function(ErrorGlobalEventHandlerState value)? error,
    TResult Function(LoadingGlobalEventHandlerState value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorGlobalEventHandlerState implements GlobalEventHandlerState {
  const factory ErrorGlobalEventHandlerState(
          final GlobalEventHandlerStateError error) =
      _$ErrorGlobalEventHandlerState;

  GlobalEventHandlerStateError get error;
  @JsonKey(ignore: true)
  _$$ErrorGlobalEventHandlerStateCopyWith<_$ErrorGlobalEventHandlerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingGlobalEventHandlerStateCopyWith<$Res> {
  factory _$$LoadingGlobalEventHandlerStateCopyWith(
          _$LoadingGlobalEventHandlerState value,
          $Res Function(_$LoadingGlobalEventHandlerState) then) =
      __$$LoadingGlobalEventHandlerStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGlobalEventHandlerStateCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateCopyWithImpl<$Res,
        _$LoadingGlobalEventHandlerState>
    implements _$$LoadingGlobalEventHandlerStateCopyWith<$Res> {
  __$$LoadingGlobalEventHandlerStateCopyWithImpl(
      _$LoadingGlobalEventHandlerState _value,
      $Res Function(_$LoadingGlobalEventHandlerState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingGlobalEventHandlerState
    with DiagnosticableTreeMixin
    implements LoadingGlobalEventHandlerState {
  const _$LoadingGlobalEventHandlerState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalEventHandlerState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'GlobalEventHandlerState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingGlobalEventHandlerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(GlobalEventHandlerStateError error) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(GlobalEventHandlerStateError error)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(GlobalEventHandlerStateError error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleGlobalEventHandlerState value) idle,
    required TResult Function(ErrorGlobalEventHandlerState value) error,
    required TResult Function(LoadingGlobalEventHandlerState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IdleGlobalEventHandlerState value)? idle,
    TResult? Function(ErrorGlobalEventHandlerState value)? error,
    TResult? Function(LoadingGlobalEventHandlerState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleGlobalEventHandlerState value)? idle,
    TResult Function(ErrorGlobalEventHandlerState value)? error,
    TResult Function(LoadingGlobalEventHandlerState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingGlobalEventHandlerState
    implements GlobalEventHandlerState {
  const factory LoadingGlobalEventHandlerState() =
      _$LoadingGlobalEventHandlerState;
}

/// @nodoc
mixin _$GlobalEventHandlerStateError {
  void Function()? get retry => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error, VoidCallback? retry) unknownError,
    required TResult Function(VoidCallback? retry) internetError,
    required TResult Function(
            String? title, String description, VoidCallback? retry)
        generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error, VoidCallback? retry)? unknownError,
    TResult? Function(VoidCallback? retry)? internetError,
    TResult? Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(InternetError value) internetError,
    required TResult Function(GeneralError value) generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(InternetError value)? internetError,
    TResult? Function(GeneralError value)? generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(InternetError value)? internetError,
    TResult Function(GeneralError value)? generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalEventHandlerStateErrorCopyWith<GlobalEventHandlerStateError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory $GlobalEventHandlerStateErrorCopyWith(
          GlobalEventHandlerStateError value,
          $Res Function(GlobalEventHandlerStateError) then) =
      _$GlobalEventHandlerStateErrorCopyWithImpl<$Res,
          GlobalEventHandlerStateError>;
  @useResult
  $Res call({void Function()? retry});
}

/// @nodoc
class _$GlobalEventHandlerStateErrorCopyWithImpl<$Res,
        $Val extends GlobalEventHandlerStateError>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  _$GlobalEventHandlerStateErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = freezed,
  }) {
    return _then(_value.copyWith(
      retry: freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnknownErrorCopyWith<$Res>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory _$$UnknownErrorCopyWith(
          _$UnknownError value, $Res Function(_$UnknownError) then) =
      __$$UnknownErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error, VoidCallback? retry});
}

/// @nodoc
class __$$UnknownErrorCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateErrorCopyWithImpl<$Res, _$UnknownError>
    implements _$$UnknownErrorCopyWith<$Res> {
  __$$UnknownErrorCopyWithImpl(
      _$UnknownError _value, $Res Function(_$UnknownError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? retry = freezed,
  }) {
    return _then(_$UnknownError(
      freezed == error ? _value.error : error,
      freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$UnknownError with DiagnosticableTreeMixin implements UnknownError {
  const _$UnknownError(this.error, [this.retry]);

  @override
  final Object? error;
  @override
  final VoidCallback? retry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalEventHandlerStateError.unknownError(error: $error, retry: $retry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'GlobalEventHandlerStateError.unknownError'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('retry', retry));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorCopyWith<_$UnknownError> get copyWith =>
      __$$UnknownErrorCopyWithImpl<_$UnknownError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error, VoidCallback? retry) unknownError,
    required TResult Function(VoidCallback? retry) internetError,
    required TResult Function(
            String? title, String description, VoidCallback? retry)
        generalError,
  }) {
    return unknownError(error, retry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error, VoidCallback? retry)? unknownError,
    TResult? Function(VoidCallback? retry)? internetError,
    TResult? Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) {
    return unknownError?.call(error, retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(error, retry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(InternetError value) internetError,
    required TResult Function(GeneralError value) generalError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(InternetError value)? internetError,
    TResult? Function(GeneralError value)? generalError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(InternetError value)? internetError,
    TResult Function(GeneralError value)? generalError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements GlobalEventHandlerStateError {
  const factory UnknownError(final Object? error, [final VoidCallback? retry]) =
      _$UnknownError;

  Object? get error;
  @override
  VoidCallback? get retry;
  @override
  @JsonKey(ignore: true)
  _$$UnknownErrorCopyWith<_$UnknownError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternetErrorCopyWith<$Res>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory _$$InternetErrorCopyWith(
          _$InternetError value, $Res Function(_$InternetError) then) =
      __$$InternetErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VoidCallback? retry});
}

/// @nodoc
class __$$InternetErrorCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateErrorCopyWithImpl<$Res, _$InternetError>
    implements _$$InternetErrorCopyWith<$Res> {
  __$$InternetErrorCopyWithImpl(
      _$InternetError _value, $Res Function(_$InternetError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = freezed,
  }) {
    return _then(_$InternetError(
      freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$InternetError with DiagnosticableTreeMixin implements InternetError {
  const _$InternetError([this.retry]);

  @override
  final VoidCallback? retry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalEventHandlerStateError.internetError(retry: $retry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'GlobalEventHandlerStateError.internetError'))
      ..add(DiagnosticsProperty('retry', retry));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternetErrorCopyWith<_$InternetError> get copyWith =>
      __$$InternetErrorCopyWithImpl<_$InternetError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error, VoidCallback? retry) unknownError,
    required TResult Function(VoidCallback? retry) internetError,
    required TResult Function(
            String? title, String description, VoidCallback? retry)
        generalError,
  }) {
    return internetError(retry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error, VoidCallback? retry)? unknownError,
    TResult? Function(VoidCallback? retry)? internetError,
    TResult? Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) {
    return internetError?.call(retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
    required TResult orElse(),
  }) {
    if (internetError != null) {
      return internetError(retry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(InternetError value) internetError,
    required TResult Function(GeneralError value) generalError,
  }) {
    return internetError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(InternetError value)? internetError,
    TResult? Function(GeneralError value)? generalError,
  }) {
    return internetError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(InternetError value)? internetError,
    TResult Function(GeneralError value)? generalError,
    required TResult orElse(),
  }) {
    if (internetError != null) {
      return internetError(this);
    }
    return orElse();
  }
}

abstract class InternetError implements GlobalEventHandlerStateError {
  const factory InternetError([final VoidCallback? retry]) = _$InternetError;

  @override
  VoidCallback? get retry;
  @override
  @JsonKey(ignore: true)
  _$$InternetErrorCopyWith<_$InternetError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeneralErrorCopyWith<$Res>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory _$$GeneralErrorCopyWith(
          _$GeneralError value, $Res Function(_$GeneralError) then) =
      __$$GeneralErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String description, VoidCallback? retry});
}

/// @nodoc
class __$$GeneralErrorCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateErrorCopyWithImpl<$Res, _$GeneralError>
    implements _$$GeneralErrorCopyWith<$Res> {
  __$$GeneralErrorCopyWithImpl(
      _$GeneralError _value, $Res Function(_$GeneralError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = null,
    Object? retry = freezed,
  }) {
    return _then(_$GeneralError(
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$GeneralError with DiagnosticableTreeMixin implements GeneralError {
  const _$GeneralError(this.title, this.description, [this.retry]);

  @override
  final String? title;
  @override
  final String description;
  @override
  final VoidCallback? retry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalEventHandlerStateError.generalError(title: $title, description: $description, retry: $retry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'GlobalEventHandlerStateError.generalError'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('retry', retry));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralErrorCopyWith<_$GeneralError> get copyWith =>
      __$$GeneralErrorCopyWithImpl<_$GeneralError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error, VoidCallback? retry) unknownError,
    required TResult Function(VoidCallback? retry) internetError,
    required TResult Function(
            String? title, String description, VoidCallback? retry)
        generalError,
  }) {
    return generalError(title, description, retry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error, VoidCallback? retry)? unknownError,
    TResult? Function(VoidCallback? retry)? internetError,
    TResult? Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) {
    return generalError?.call(title, description, retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(title, description, retry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(InternetError value) internetError,
    required TResult Function(GeneralError value) generalError,
  }) {
    return generalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnknownError value)? unknownError,
    TResult? Function(InternetError value)? internetError,
    TResult? Function(GeneralError value)? generalError,
  }) {
    return generalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnknownError value)? unknownError,
    TResult Function(InternetError value)? internetError,
    TResult Function(GeneralError value)? generalError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(this);
    }
    return orElse();
  }
}

abstract class GeneralError implements GlobalEventHandlerStateError {
  const factory GeneralError(final String? title, final String description,
      [final VoidCallback? retry]) = _$GeneralError;

  String? get title;
  String get description;
  @override
  VoidCallback? get retry;
  @override
  @JsonKey(ignore: true)
  _$$GeneralErrorCopyWith<_$GeneralError> get copyWith =>
      throw _privateConstructorUsedError;
}
