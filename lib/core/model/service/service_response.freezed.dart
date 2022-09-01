// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function(NetworkException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceResponseData<T> value) data,
    required TResult Function(ServiceResponseError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServiceResponseData<T> value)? data,
    TResult Function(ServiceResponseError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceResponseData<T> value)? data,
    TResult Function(ServiceResponseError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceResponseCopyWith<T, $Res> {
  factory $ServiceResponseCopyWith(
          ServiceResponse<T> value, $Res Function(ServiceResponse<T>) then) =
      _$ServiceResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ServiceResponseCopyWithImpl<T, $Res>
    implements $ServiceResponseCopyWith<T, $Res> {
  _$ServiceResponseCopyWithImpl(this._value, this._then);

  final ServiceResponse<T> _value;
  // ignore: unused_field
  final $Res Function(ServiceResponse<T>) _then;
}

/// @nodoc
abstract class _$$ServiceResponseDataCopyWith<T, $Res> {
  factory _$$ServiceResponseDataCopyWith(_$ServiceResponseData<T> value,
          $Res Function(_$ServiceResponseData<T>) then) =
      __$$ServiceResponseDataCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$ServiceResponseDataCopyWithImpl<T, $Res>
    extends _$ServiceResponseCopyWithImpl<T, $Res>
    implements _$$ServiceResponseDataCopyWith<T, $Res> {
  __$$ServiceResponseDataCopyWithImpl(_$ServiceResponseData<T> _value,
      $Res Function(_$ServiceResponseData<T>) _then)
      : super(_value, (v) => _then(v as _$ServiceResponseData<T>));

  @override
  _$ServiceResponseData<T> get _value =>
      super._value as _$ServiceResponseData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ServiceResponseData<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ServiceResponseData<T> implements ServiceResponseData<T> {
  _$ServiceResponseData(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ServiceResponse<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResponseData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$ServiceResponseDataCopyWith<T, _$ServiceResponseData<T>> get copyWith =>
      __$$ServiceResponseDataCopyWithImpl<T, _$ServiceResponseData<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function(NetworkException error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkException error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkException error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServiceResponseData<T> value) data,
    required TResult Function(ServiceResponseError<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServiceResponseData<T> value)? data,
    TResult Function(ServiceResponseError<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceResponseData<T> value)? data,
    TResult Function(ServiceResponseError<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ServiceResponseData<T> implements ServiceResponse<T> {
  factory ServiceResponseData(final T data) = _$ServiceResponseData<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ServiceResponseDataCopyWith<T, _$ServiceResponseData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceResponseErrorCopyWith<T, $Res> {
  factory _$$ServiceResponseErrorCopyWith(_$ServiceResponseError<T> value,
          $Res Function(_$ServiceResponseError<T>) then) =
      __$$ServiceResponseErrorCopyWithImpl<T, $Res>;
  $Res call({NetworkException error});

  $NetworkExceptionCopyWith<$Res> get error;
}

/// @nodoc
class __$$ServiceResponseErrorCopyWithImpl<T, $Res>
    extends _$ServiceResponseCopyWithImpl<T, $Res>
    implements _$$ServiceResponseErrorCopyWith<T, $Res> {
  __$$ServiceResponseErrorCopyWithImpl(_$ServiceResponseError<T> _value,
      $Res Function(_$ServiceResponseError<T>) _then)
      : super(_value, (v) => _then(v as _$ServiceResponseError<T>));

  @override
  _$ServiceResponseError<T> get _value =>
      super._value as _$ServiceResponseError<T>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ServiceResponseError<T>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkException,
    ));
  }

  @override
  $NetworkExceptionCopyWith<$Res> get error {
    return $NetworkExceptionCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ServiceResponseError<T> implements ServiceResponseError<T> {
  _$ServiceResponseError(this.error);

  @override
  final NetworkException error;

  @override
  String toString() {
    return 'ServiceResponse<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResponseError<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ServiceResponseErrorCopyWith<T, _$ServiceResponseError<T>> get copyWith =>
      __$$ServiceResponseErrorCopyWithImpl<T, _$ServiceResponseError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) data,
    required TResult Function(NetworkException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? data,
    TResult Function(NetworkException error)? error,
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
    required TResult Function(ServiceResponseData<T> value) data,
    required TResult Function(ServiceResponseError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServiceResponseData<T> value)? data,
    TResult Function(ServiceResponseError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServiceResponseData<T> value)? data,
    TResult Function(ServiceResponseError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ServiceResponseError<T> implements ServiceResponse<T> {
  factory ServiceResponseError(final NetworkException error) =
      _$ServiceResponseError<T>;

  NetworkException get error;
  @JsonKey(ignore: true)
  _$$ServiceResponseErrorCopyWith<T, _$ServiceResponseError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
