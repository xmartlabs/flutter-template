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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$IdleGlobalEventHandlerStateImplCopyWith<$Res> {
  factory _$$IdleGlobalEventHandlerStateImplCopyWith(
          _$IdleGlobalEventHandlerStateImpl value,
          $Res Function(_$IdleGlobalEventHandlerStateImpl) then) =
      __$$IdleGlobalEventHandlerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleGlobalEventHandlerStateImplCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateCopyWithImpl<$Res,
        _$IdleGlobalEventHandlerStateImpl>
    implements _$$IdleGlobalEventHandlerStateImplCopyWith<$Res> {
  __$$IdleGlobalEventHandlerStateImplCopyWithImpl(
      _$IdleGlobalEventHandlerStateImpl _value,
      $Res Function(_$IdleGlobalEventHandlerStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleGlobalEventHandlerStateImpl
    with DiagnosticableTreeMixin
    implements IdleGlobalEventHandlerState {
  const _$IdleGlobalEventHandlerStateImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleGlobalEventHandlerStateImpl);
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
  const factory IdleGlobalEventHandlerState() =
      _$IdleGlobalEventHandlerStateImpl;
}

/// @nodoc
abstract class _$$ErrorGlobalEventHandlerStateImplCopyWith<$Res> {
  factory _$$ErrorGlobalEventHandlerStateImplCopyWith(
          _$ErrorGlobalEventHandlerStateImpl value,
          $Res Function(_$ErrorGlobalEventHandlerStateImpl) then) =
      __$$ErrorGlobalEventHandlerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalEventHandlerStateError error});

  $GlobalEventHandlerStateErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorGlobalEventHandlerStateImplCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateCopyWithImpl<$Res,
        _$ErrorGlobalEventHandlerStateImpl>
    implements _$$ErrorGlobalEventHandlerStateImplCopyWith<$Res> {
  __$$ErrorGlobalEventHandlerStateImplCopyWithImpl(
      _$ErrorGlobalEventHandlerStateImpl _value,
      $Res Function(_$ErrorGlobalEventHandlerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorGlobalEventHandlerStateImpl(
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

class _$ErrorGlobalEventHandlerStateImpl
    with DiagnosticableTreeMixin
    implements ErrorGlobalEventHandlerState {
  const _$ErrorGlobalEventHandlerStateImpl(this.error);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorGlobalEventHandlerStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorGlobalEventHandlerStateImplCopyWith<
          _$ErrorGlobalEventHandlerStateImpl>
      get copyWith => __$$ErrorGlobalEventHandlerStateImplCopyWithImpl<
          _$ErrorGlobalEventHandlerStateImpl>(this, _$identity);

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
      _$ErrorGlobalEventHandlerStateImpl;

  GlobalEventHandlerStateError get error;
  @JsonKey(ignore: true)
  _$$ErrorGlobalEventHandlerStateImplCopyWith<
          _$ErrorGlobalEventHandlerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingGlobalEventHandlerStateImplCopyWith<$Res> {
  factory _$$LoadingGlobalEventHandlerStateImplCopyWith(
          _$LoadingGlobalEventHandlerStateImpl value,
          $Res Function(_$LoadingGlobalEventHandlerStateImpl) then) =
      __$$LoadingGlobalEventHandlerStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGlobalEventHandlerStateImplCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateCopyWithImpl<$Res,
        _$LoadingGlobalEventHandlerStateImpl>
    implements _$$LoadingGlobalEventHandlerStateImplCopyWith<$Res> {
  __$$LoadingGlobalEventHandlerStateImplCopyWithImpl(
      _$LoadingGlobalEventHandlerStateImpl _value,
      $Res Function(_$LoadingGlobalEventHandlerStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingGlobalEventHandlerStateImpl
    with DiagnosticableTreeMixin
    implements LoadingGlobalEventHandlerState {
  const _$LoadingGlobalEventHandlerStateImpl();

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingGlobalEventHandlerStateImpl);
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
      _$LoadingGlobalEventHandlerStateImpl;
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
abstract class _$$UnknownErrorImplCopyWith<$Res>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? error, VoidCallback? retry});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? retry = freezed,
  }) {
    return _then(_$UnknownErrorImpl(
      freezed == error ? _value.error : error,
      freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$UnknownErrorImpl with DiagnosticableTreeMixin implements UnknownError {
  const _$UnknownErrorImpl(this.error, [this.retry]);

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
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

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
      _$UnknownErrorImpl;

  Object? get error;
  @override
  VoidCallback? get retry;
  @override
  @JsonKey(ignore: true)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternetErrorImplCopyWith<$Res>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory _$$InternetErrorImplCopyWith(
          _$InternetErrorImpl value, $Res Function(_$InternetErrorImpl) then) =
      __$$InternetErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VoidCallback? retry});
}

/// @nodoc
class __$$InternetErrorImplCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateErrorCopyWithImpl<$Res,
        _$InternetErrorImpl> implements _$$InternetErrorImplCopyWith<$Res> {
  __$$InternetErrorImplCopyWithImpl(
      _$InternetErrorImpl _value, $Res Function(_$InternetErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = freezed,
  }) {
    return _then(_$InternetErrorImpl(
      freezed == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$InternetErrorImpl
    with DiagnosticableTreeMixin
    implements InternetError {
  const _$InternetErrorImpl([this.retry]);

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
  _$$InternetErrorImplCopyWith<_$InternetErrorImpl> get copyWith =>
      __$$InternetErrorImplCopyWithImpl<_$InternetErrorImpl>(this, _$identity);

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
  const factory InternetError([final VoidCallback? retry]) =
      _$InternetErrorImpl;

  @override
  VoidCallback? get retry;
  @override
  @JsonKey(ignore: true)
  _$$InternetErrorImplCopyWith<_$InternetErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeneralErrorImplCopyWith<$Res>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory _$$GeneralErrorImplCopyWith(
          _$GeneralErrorImpl value, $Res Function(_$GeneralErrorImpl) then) =
      __$$GeneralErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String description, VoidCallback? retry});
}

/// @nodoc
class __$$GeneralErrorImplCopyWithImpl<$Res>
    extends _$GlobalEventHandlerStateErrorCopyWithImpl<$Res, _$GeneralErrorImpl>
    implements _$$GeneralErrorImplCopyWith<$Res> {
  __$$GeneralErrorImplCopyWithImpl(
      _$GeneralErrorImpl _value, $Res Function(_$GeneralErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = null,
    Object? retry = freezed,
  }) {
    return _then(_$GeneralErrorImpl(
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

class _$GeneralErrorImpl with DiagnosticableTreeMixin implements GeneralError {
  const _$GeneralErrorImpl(this.title, this.description, [this.retry]);

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
  _$$GeneralErrorImplCopyWith<_$GeneralErrorImpl> get copyWith =>
      __$$GeneralErrorImplCopyWithImpl<_$GeneralErrorImpl>(this, _$identity);

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
      [final VoidCallback? retry]) = _$GeneralErrorImpl;

  String? get title;
  String get description;
  @override
  VoidCallback? get retry;
  @override
  @JsonKey(ignore: true)
  _$$GeneralErrorImplCopyWith<_$GeneralErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
