// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeneralError implements DiagnosticableTreeMixin {

 String get description; String? get title; dynamic get cause;
/// Create a copy of GeneralError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralErrorCopyWith<GeneralError> get copyWith => _$GeneralErrorCopyWithImpl<GeneralError>(this as GeneralError, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as GeneralError;
  properties
    ..add(DiagnosticsProperty('type', 'GeneralError'))
    ..add(DiagnosticsProperty('description', _this.description))..add(DiagnosticsProperty('title', _this.title))..add(DiagnosticsProperty('cause', _this.cause));
}

@override
bool operator ==(Object other) {
  final _this = this as GeneralError;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralError&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.cause, _this.cause));
}


@override
int get hashCode {
  final _this = this as GeneralError;
  return Object.hash(runtimeType,_this.description,_this.title,const DeepCollectionEquality().hash(_this.cause));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as GeneralError;
  return 'GeneralError(description: ${_this.description}, title: ${_this.title}, cause: ${_this.cause})';
}


}

/// @nodoc
abstract mixin class $GeneralErrorCopyWith<$Res>  {
  factory $GeneralErrorCopyWith(GeneralError value, $Res Function(GeneralError) _then) = _$GeneralErrorCopyWithImpl;
@useResult
$Res call({
 String description, String? title, dynamic cause
});




}
/// @nodoc
class _$GeneralErrorCopyWithImpl<$Res>
    implements $GeneralErrorCopyWith<$Res> {
  _$GeneralErrorCopyWithImpl(this._self, this._then);

  final GeneralError _self;
  final $Res Function(GeneralError) _then;

/// Create a copy of GeneralError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? title = freezed,Object? cause = freezed,}) {
  return _then(GeneralError(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneralError].
extension GeneralErrorPatterns on GeneralError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneralError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneralError() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneralError value)  $default,){
final _that = this;
switch (_that) {
case _GeneralError():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneralError value)?  $default,){
final _that = this;
switch (_that) {
case _GeneralError() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String description,  String? title,  dynamic cause)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneralError() when $default != null:
return $default(_that.description,_that.title,_that.cause);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String description,  String? title,  dynamic cause)  $default,) {final _that = this;
switch (_that) {
case _GeneralError():
return $default(_that.description,_that.title,_that.cause);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String description,  String? title,  dynamic cause)?  $default,) {final _that = this;
switch (_that) {
case _GeneralError() when $default != null:
return $default(_that.description,_that.title,_that.cause);case _:
  return null;

}
}

}

/// @nodoc


class _GeneralError with DiagnosticableTreeMixin implements GeneralError {
  const _GeneralError({required this.description, this.title, this.cause});
  

@override final  String description;
@override final  String? title;
@override final  dynamic cause;

/// Create a copy of GeneralError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralErrorCopyWith<_GeneralError> get copyWith => __$GeneralErrorCopyWithImpl<_GeneralError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GeneralError'))
    ..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('cause', cause));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralError&&(identical(other.description, description) || other.description == description)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.cause, cause));
}


@override
int get hashCode {
    return Object.hash(runtimeType,description,title,const DeepCollectionEquality().hash(cause));
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GeneralError(description: $description, title: $title, cause: $cause)';
}


}

/// @nodoc
abstract mixin class _$GeneralErrorCopyWith<$Res> implements $GeneralErrorCopyWith<$Res> {
  factory _$GeneralErrorCopyWith(_GeneralError value, $Res Function(_GeneralError) _then) = __$GeneralErrorCopyWithImpl;
@override @useResult
$Res call({
 String description, String? title, dynamic cause
});




}
/// @nodoc
class __$GeneralErrorCopyWithImpl<$Res>
    implements _$GeneralErrorCopyWith<$Res> {
  __$GeneralErrorCopyWithImpl(this._self, this._then);

  final _GeneralError _self;
  final $Res Function(_GeneralError) _then;

/// Create a copy of GeneralError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? title = freezed,Object? cause = freezed,}) {
  return _then(_GeneralError(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,cause: freezed == cause ? _self.cause : cause // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
