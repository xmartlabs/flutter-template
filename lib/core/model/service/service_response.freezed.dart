// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    TResult? Function(T data)? data,
    TResult? Function(NetworkException error)? error,
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
    TResult? Function(ServiceResponseData<T> value)? data,
    TResult? Function(ServiceResponseError<T> value)? error,
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
      _$ServiceResponseCopyWithImpl<T, $Res, ServiceResponse<T>>;
}

/// @nodoc
class _$ServiceResponseCopyWithImpl<T, $Res, $Val extends ServiceResponse<T>>
    implements $ServiceResponseCopyWith<T, $Res> {
  _$ServiceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServiceResponseDataImplCopyWith<T, $Res> {
  factory _$$ServiceResponseDataImplCopyWith(_$ServiceResponseDataImpl<T> value,
          $Res Function(_$ServiceResponseDataImpl<T>) then) =
      __$$ServiceResponseDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ServiceResponseDataImplCopyWithImpl<T, $Res>
    extends _$ServiceResponseCopyWithImpl<T, $Res, _$ServiceResponseDataImpl<T>>
    implements _$$ServiceResponseDataImplCopyWith<T, $Res> {
  __$$ServiceResponseDataImplCopyWithImpl(_$ServiceResponseDataImpl<T> _value,
      $Res Function(_$ServiceResponseDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ServiceResponseDataImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ServiceResponseDataImpl<T> implements ServiceResponseData<T> {
  const _$ServiceResponseDataImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ServiceResponse<$T>.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResponseDataImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResponseDataImplCopyWith<T, _$ServiceResponseDataImpl<T>>
      get copyWith => __$$ServiceResponseDataImplCopyWithImpl<T,
          _$ServiceResponseDataImpl<T>>(this, _$identity);

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
    TResult? Function(T data)? data,
    TResult? Function(NetworkException error)? error,
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
    TResult? Function(ServiceResponseData<T> value)? data,
    TResult? Function(ServiceResponseError<T> value)? error,
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
  const factory ServiceResponseData(final T data) =
      _$ServiceResponseDataImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ServiceResponseDataImplCopyWith<T, _$ServiceResponseDataImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServiceResponseErrorImplCopyWith<T, $Res> {
  factory _$$ServiceResponseErrorImplCopyWith(
          _$ServiceResponseErrorImpl<T> value,
          $Res Function(_$ServiceResponseErrorImpl<T>) then) =
      __$$ServiceResponseErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({NetworkException error});

  $NetworkExceptionCopyWith<$Res> get error;
}

/// @nodoc
class __$$ServiceResponseErrorImplCopyWithImpl<T, $Res>
    extends _$ServiceResponseCopyWithImpl<T, $Res,
        _$ServiceResponseErrorImpl<T>>
    implements _$$ServiceResponseErrorImplCopyWith<T, $Res> {
  __$$ServiceResponseErrorImplCopyWithImpl(_$ServiceResponseErrorImpl<T> _value,
      $Res Function(_$ServiceResponseErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ServiceResponseErrorImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as NetworkException,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionCopyWith<$Res> get error {
    return $NetworkExceptionCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ServiceResponseErrorImpl<T> implements ServiceResponseError<T> {
  const _$ServiceResponseErrorImpl(this.error);

  @override
  final NetworkException error;

  @override
  String toString() {
    return 'ServiceResponse<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResponseErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResponseErrorImplCopyWith<T, _$ServiceResponseErrorImpl<T>>
      get copyWith => __$$ServiceResponseErrorImplCopyWithImpl<T,
          _$ServiceResponseErrorImpl<T>>(this, _$identity);

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
    TResult? Function(T data)? data,
    TResult? Function(NetworkException error)? error,
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
    TResult? Function(ServiceResponseData<T> value)? data,
    TResult? Function(ServiceResponseError<T> value)? error,
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
  const factory ServiceResponseError(final NetworkException error) =
      _$ServiceResponseErrorImpl<T>;

  NetworkException get error;
  @JsonKey(ignore: true)
  _$$ServiceResponseErrorImplCopyWith<T, _$ServiceResponseErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
