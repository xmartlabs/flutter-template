// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error_handler_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ErrorHandlerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(Object? error, VoidCallback? retry) unknownError,
    required TResult Function(VoidCallback? retry) internetError,
    required TResult Function(
            String? title, String description, VoidCallback? retry)
        generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitErrorHandlerState value) init,
    required TResult Function(_UnknownErrorHandlerState value) unknownError,
    required TResult Function(_InternetErrorHandlerState value) internetError,
    required TResult Function(_GeneralErrorHandlerState value) generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorHandlerStateCopyWith<$Res> {
  factory $ErrorHandlerStateCopyWith(
          ErrorHandlerState value, $Res Function(ErrorHandlerState) then) =
      _$ErrorHandlerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ErrorHandlerStateCopyWithImpl<$Res>
    implements $ErrorHandlerStateCopyWith<$Res> {
  _$ErrorHandlerStateCopyWithImpl(this._value, this._then);

  final ErrorHandlerState _value;
  // ignore: unused_field
  final $Res Function(ErrorHandlerState) _then;
}

/// @nodoc
abstract class _$$_InitErrorHandlerStateCopyWith<$Res> {
  factory _$$_InitErrorHandlerStateCopyWith(_$_InitErrorHandlerState value,
          $Res Function(_$_InitErrorHandlerState) then) =
      __$$_InitErrorHandlerStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitErrorHandlerStateCopyWithImpl<$Res>
    extends _$ErrorHandlerStateCopyWithImpl<$Res>
    implements _$$_InitErrorHandlerStateCopyWith<$Res> {
  __$$_InitErrorHandlerStateCopyWithImpl(_$_InitErrorHandlerState _value,
      $Res Function(_$_InitErrorHandlerState) _then)
      : super(_value, (v) => _then(v as _$_InitErrorHandlerState));

  @override
  _$_InitErrorHandlerState get _value =>
      super._value as _$_InitErrorHandlerState;
}

/// @nodoc

class _$_InitErrorHandlerState
    with DiagnosticableTreeMixin
    implements _InitErrorHandlerState {
  const _$_InitErrorHandlerState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorHandlerState.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ErrorHandlerState.init'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitErrorHandlerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(Object? error, VoidCallback? retry) unknownError,
    required TResult Function(VoidCallback? retry) internetError,
    required TResult Function(
            String? title, String description, VoidCallback? retry)
        generalError,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitErrorHandlerState value) init,
    required TResult Function(_UnknownErrorHandlerState value) unknownError,
    required TResult Function(_InternetErrorHandlerState value) internetError,
    required TResult Function(_GeneralErrorHandlerState value) generalError,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _InitErrorHandlerState implements ErrorHandlerState {
  const factory _InitErrorHandlerState() = _$_InitErrorHandlerState;
}

/// @nodoc
abstract class _$$_UnknownErrorHandlerStateCopyWith<$Res> {
  factory _$$_UnknownErrorHandlerStateCopyWith(
          _$_UnknownErrorHandlerState value,
          $Res Function(_$_UnknownErrorHandlerState) then) =
      __$$_UnknownErrorHandlerStateCopyWithImpl<$Res>;
  $Res call({Object? error, VoidCallback? retry});
}

/// @nodoc
class __$$_UnknownErrorHandlerStateCopyWithImpl<$Res>
    extends _$ErrorHandlerStateCopyWithImpl<$Res>
    implements _$$_UnknownErrorHandlerStateCopyWith<$Res> {
  __$$_UnknownErrorHandlerStateCopyWithImpl(_$_UnknownErrorHandlerState _value,
      $Res Function(_$_UnknownErrorHandlerState) _then)
      : super(_value, (v) => _then(v as _$_UnknownErrorHandlerState));

  @override
  _$_UnknownErrorHandlerState get _value =>
      super._value as _$_UnknownErrorHandlerState;

  @override
  $Res call({
    Object? error = freezed,
    Object? retry = freezed,
  }) {
    return _then(_$_UnknownErrorHandlerState(
      error == freezed ? _value.error : error,
      retry == freezed
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_UnknownErrorHandlerState
    with DiagnosticableTreeMixin
    implements _UnknownErrorHandlerState {
  const _$_UnknownErrorHandlerState(this.error, [this.retry]);

  @override
  final Object? error;
  @override
  final VoidCallback? retry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorHandlerState.unknownError(error: $error, retry: $retry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorHandlerState.unknownError'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('retry', retry));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnknownErrorHandlerState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), retry);

  @JsonKey(ignore: true)
  @override
  _$$_UnknownErrorHandlerStateCopyWith<_$_UnknownErrorHandlerState>
      get copyWith => __$$_UnknownErrorHandlerStateCopyWithImpl<
          _$_UnknownErrorHandlerState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
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
    TResult Function()? init,
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) {
    return unknownError?.call(error, retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
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
    required TResult Function(_InitErrorHandlerState value) init,
    required TResult Function(_UnknownErrorHandlerState value) unknownError,
    required TResult Function(_InternetErrorHandlerState value) internetError,
    required TResult Function(_GeneralErrorHandlerState value) generalError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownErrorHandlerState implements ErrorHandlerState {
  const factory _UnknownErrorHandlerState(final Object? error,
      [final VoidCallback? retry]) = _$_UnknownErrorHandlerState;

  Object? get error;
  VoidCallback? get retry;
  @JsonKey(ignore: true)
  _$$_UnknownErrorHandlerStateCopyWith<_$_UnknownErrorHandlerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InternetErrorHandlerStateCopyWith<$Res> {
  factory _$$_InternetErrorHandlerStateCopyWith(
          _$_InternetErrorHandlerState value,
          $Res Function(_$_InternetErrorHandlerState) then) =
      __$$_InternetErrorHandlerStateCopyWithImpl<$Res>;
  $Res call({VoidCallback? retry});
}

/// @nodoc
class __$$_InternetErrorHandlerStateCopyWithImpl<$Res>
    extends _$ErrorHandlerStateCopyWithImpl<$Res>
    implements _$$_InternetErrorHandlerStateCopyWith<$Res> {
  __$$_InternetErrorHandlerStateCopyWithImpl(
      _$_InternetErrorHandlerState _value,
      $Res Function(_$_InternetErrorHandlerState) _then)
      : super(_value, (v) => _then(v as _$_InternetErrorHandlerState));

  @override
  _$_InternetErrorHandlerState get _value =>
      super._value as _$_InternetErrorHandlerState;

  @override
  $Res call({
    Object? retry = freezed,
  }) {
    return _then(_$_InternetErrorHandlerState(
      retry == freezed
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_InternetErrorHandlerState
    with DiagnosticableTreeMixin
    implements _InternetErrorHandlerState {
  const _$_InternetErrorHandlerState([this.retry]);

  @override
  final VoidCallback? retry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorHandlerState.internetError(retry: $retry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorHandlerState.internetError'))
      ..add(DiagnosticsProperty('retry', retry));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternetErrorHandlerState &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  _$$_InternetErrorHandlerStateCopyWith<_$_InternetErrorHandlerState>
      get copyWith => __$$_InternetErrorHandlerStateCopyWithImpl<
          _$_InternetErrorHandlerState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
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
    TResult Function()? init,
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) {
    return internetError?.call(retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
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
    required TResult Function(_InitErrorHandlerState value) init,
    required TResult Function(_UnknownErrorHandlerState value) unknownError,
    required TResult Function(_InternetErrorHandlerState value) internetError,
    required TResult Function(_GeneralErrorHandlerState value) generalError,
  }) {
    return internetError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
  }) {
    return internetError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
    required TResult orElse(),
  }) {
    if (internetError != null) {
      return internetError(this);
    }
    return orElse();
  }
}

abstract class _InternetErrorHandlerState implements ErrorHandlerState {
  const factory _InternetErrorHandlerState([final VoidCallback? retry]) =
      _$_InternetErrorHandlerState;

  VoidCallback? get retry;
  @JsonKey(ignore: true)
  _$$_InternetErrorHandlerStateCopyWith<_$_InternetErrorHandlerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GeneralErrorHandlerStateCopyWith<$Res> {
  factory _$$_GeneralErrorHandlerStateCopyWith(
          _$_GeneralErrorHandlerState value,
          $Res Function(_$_GeneralErrorHandlerState) then) =
      __$$_GeneralErrorHandlerStateCopyWithImpl<$Res>;
  $Res call({String? title, String description, VoidCallback? retry});
}

/// @nodoc
class __$$_GeneralErrorHandlerStateCopyWithImpl<$Res>
    extends _$ErrorHandlerStateCopyWithImpl<$Res>
    implements _$$_GeneralErrorHandlerStateCopyWith<$Res> {
  __$$_GeneralErrorHandlerStateCopyWithImpl(_$_GeneralErrorHandlerState _value,
      $Res Function(_$_GeneralErrorHandlerState) _then)
      : super(_value, (v) => _then(v as _$_GeneralErrorHandlerState));

  @override
  _$_GeneralErrorHandlerState get _value =>
      super._value as _$_GeneralErrorHandlerState;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? retry = freezed,
  }) {
    return _then(_$_GeneralErrorHandlerState(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      retry == freezed
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
    ));
  }
}

/// @nodoc

class _$_GeneralErrorHandlerState
    with DiagnosticableTreeMixin
    implements _GeneralErrorHandlerState {
  const _$_GeneralErrorHandlerState(this.title, this.description, [this.retry]);

  @override
  final String? title;
  @override
  final String description;
  @override
  final VoidCallback? retry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorHandlerState.generalError(title: $title, description: $description, retry: $retry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorHandlerState.generalError'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('retry', retry));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralErrorHandlerState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      retry);

  @JsonKey(ignore: true)
  @override
  _$$_GeneralErrorHandlerStateCopyWith<_$_GeneralErrorHandlerState>
      get copyWith => __$$_GeneralErrorHandlerStateCopyWithImpl<
          _$_GeneralErrorHandlerState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
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
    TResult Function()? init,
    TResult Function(Object? error, VoidCallback? retry)? unknownError,
    TResult Function(VoidCallback? retry)? internetError,
    TResult Function(String? title, String description, VoidCallback? retry)?
        generalError,
  }) {
    return generalError?.call(title, description, retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
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
    required TResult Function(_InitErrorHandlerState value) init,
    required TResult Function(_UnknownErrorHandlerState value) unknownError,
    required TResult Function(_InternetErrorHandlerState value) internetError,
    required TResult Function(_GeneralErrorHandlerState value) generalError,
  }) {
    return generalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
  }) {
    return generalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitErrorHandlerState value)? init,
    TResult Function(_UnknownErrorHandlerState value)? unknownError,
    TResult Function(_InternetErrorHandlerState value)? internetError,
    TResult Function(_GeneralErrorHandlerState value)? generalError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(this);
    }
    return orElse();
  }
}

abstract class _GeneralErrorHandlerState implements ErrorHandlerState {
  const factory _GeneralErrorHandlerState(
      final String? title, final String description,
      [final VoidCallback? retry]) = _$_GeneralErrorHandlerState;

  String? get title;
  String get description;
  VoidCallback? get retry;
  @JsonKey(ignore: true)
  _$$_GeneralErrorHandlerStateCopyWith<_$_GeneralErrorHandlerState>
      get copyWith => throw _privateConstructorUsedError;
}
