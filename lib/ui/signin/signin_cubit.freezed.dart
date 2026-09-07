// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInBaseState {

 String? get email; String? get password; String get error;
/// Create a copy of SignInBaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInBaseStateCopyWith<SignInBaseState> get copyWith => _$SignInBaseStateCopyWithImpl<SignInBaseState>(this as SignInBaseState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SignInBaseState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInBaseState&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as SignInBaseState;
  return Object.hash(runtimeType,_this.email,_this.password,_this.error);
}

@override
String toString() {
  final _this = this as SignInBaseState;
  return 'SignInBaseState(email: ${_this.email}, password: ${_this.password}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $SignInBaseStateCopyWith<$Res>  {
  factory $SignInBaseStateCopyWith(SignInBaseState value, $Res Function(SignInBaseState) _then) = _$SignInBaseStateCopyWithImpl;
@useResult
$Res call({
 String? email, String? password, String error
});




}
/// @nodoc
class _$SignInBaseStateCopyWithImpl<$Res>
    implements $SignInBaseStateCopyWith<$Res> {
  _$SignInBaseStateCopyWithImpl(this._self, this._then);

  final SignInBaseState _self;
  final $Res Function(SignInBaseState) _then;

/// Create a copy of SignInBaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? password = freezed,Object? error = null,}) {
  return _then(SignInBaseState.state(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignInBaseState].
extension SignInBaseStatePatterns on SignInBaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignInState value)?  state,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignInState() when state != null:
return state(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignInState value)  state,}){
final _that = this;
switch (_that) {
case SignInState():
return state(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignInState value)?  state,}){
final _that = this;
switch (_that) {
case SignInState() when state != null:
return state(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? email,  String? password,  String error)?  state,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignInState() when state != null:
return state(_that.email,_that.password,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? email,  String? password,  String error)  state,}) {final _that = this;
switch (_that) {
case SignInState():
return state(_that.email,_that.password,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? email,  String? password,  String error)?  state,}) {final _that = this;
switch (_that) {
case SignInState() when state != null:
return state(_that.email,_that.password,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SignInState implements SignInBaseState {
  const SignInState({required this.email, required this.password, required this.error});
  

@override final  String? email;
@override final  String? password;
@override final  String error;

/// Create a copy of SignInBaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInStateCopyWith<SignInState> get copyWith => _$SignInStateCopyWithImpl<SignInState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email,password,error);
}

@override
String toString() {
    return 'SignInBaseState.state(email: $email, password: $password, error: $error)';
}


}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res> implements $SignInBaseStateCopyWith<$Res> {
  factory $SignInStateCopyWith(SignInState value, $Res Function(SignInState) _then) = _$SignInStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? password, String error
});




}
/// @nodoc
class _$SignInStateCopyWithImpl<$Res>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

/// Create a copy of SignInBaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? password = freezed,Object? error = null,}) {
  return _then(SignInState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
