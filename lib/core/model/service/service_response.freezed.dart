// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceResponse<T> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceResponse<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ServiceResponse<$T>()';
}


}

/// @nodoc
class $ServiceResponseCopyWith<T,$Res>  {
$ServiceResponseCopyWith(ServiceResponse<T> _, $Res Function(ServiceResponse<T>) __);
}


/// Adds pattern-matching-related methods to [ServiceResponse].
extension ServiceResponsePatterns<T> on ServiceResponse<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceResponseData<T> value)?  data,TResult Function( ServiceResponseError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceResponseData() when data != null:
return data(_that);case ServiceResponseError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceResponseData<T> value)  data,required TResult Function( ServiceResponseError<T> value)  error,}){
final _that = this;
switch (_that) {
case ServiceResponseData():
return data(_that);case ServiceResponseError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceResponseData<T> value)?  data,TResult? Function( ServiceResponseError<T> value)?  error,}){
final _that = this;
switch (_that) {
case ServiceResponseData() when data != null:
return data(_that);case ServiceResponseError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  data,TResult Function( NetworkException error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceResponseData() when data != null:
return data(_that.data);case ServiceResponseError() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  data,required TResult Function( NetworkException error)  error,}) {final _that = this;
switch (_that) {
case ServiceResponseData():
return data(_that.data);case ServiceResponseError():
return error(_that.error);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  data,TResult? Function( NetworkException error)?  error,}) {final _that = this;
switch (_that) {
case ServiceResponseData() when data != null:
return data(_that.data);case ServiceResponseError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ServiceResponseData<T> implements ServiceResponse<T> {
  const ServiceResponseData(this.data);
  

 final  T data;

/// Create a copy of ServiceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceResponseDataCopyWith<T, ServiceResponseData<T>> get copyWith => _$ServiceResponseDataCopyWithImpl<T, ServiceResponseData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceResponseData<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'ServiceResponse<$T>.data(data: $data)';
}


}

/// @nodoc
abstract mixin class $ServiceResponseDataCopyWith<T,$Res> implements $ServiceResponseCopyWith<T, $Res> {
  factory $ServiceResponseDataCopyWith(ServiceResponseData<T> value, $Res Function(ServiceResponseData<T>) _then) = _$ServiceResponseDataCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ServiceResponseDataCopyWithImpl<T,$Res>
    implements $ServiceResponseDataCopyWith<T, $Res> {
  _$ServiceResponseDataCopyWithImpl(this._self, this._then);

  final ServiceResponseData<T> _self;
  final $Res Function(ServiceResponseData<T>) _then;

/// Create a copy of ServiceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ServiceResponseData<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ServiceResponseError<T> implements ServiceResponse<T> {
  const ServiceResponseError(this.error);
  

 final  NetworkException error;

/// Create a copy of ServiceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceResponseErrorCopyWith<T, ServiceResponseError<T>> get copyWith => _$ServiceResponseErrorCopyWithImpl<T, ServiceResponseError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceResponseError<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'ServiceResponse<$T>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ServiceResponseErrorCopyWith<T,$Res> implements $ServiceResponseCopyWith<T, $Res> {
  factory $ServiceResponseErrorCopyWith(ServiceResponseError<T> value, $Res Function(ServiceResponseError<T>) _then) = _$ServiceResponseErrorCopyWithImpl;
@useResult
$Res call({
 NetworkException error
});


$NetworkExceptionCopyWith<$Res> get error;

}
/// @nodoc
class _$ServiceResponseErrorCopyWithImpl<T,$Res>
    implements $ServiceResponseErrorCopyWith<T, $Res> {
  _$ServiceResponseErrorCopyWithImpl(this._self, this._then);

  final ServiceResponseError<T> _self;
  final $Res Function(ServiceResponseError<T>) _then;

/// Create a copy of ServiceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ServiceResponseError<T>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as NetworkException,
  ));
}

/// Create a copy of ServiceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<$Res> get error {
  
  return $NetworkExceptionCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
