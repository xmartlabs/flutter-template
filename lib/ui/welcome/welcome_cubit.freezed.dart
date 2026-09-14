// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WelcomeBaseState {

 List<Project> get projects;
/// Create a copy of WelcomeBaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeBaseStateCopyWith<WelcomeBaseState> get copyWith => _$WelcomeBaseStateCopyWithImpl<WelcomeBaseState>(this as WelcomeBaseState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WelcomeBaseState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeBaseState&&const DeepCollectionEquality().equals(other.projects, _this.projects));
}


@override
int get hashCode {
  final _this = this as WelcomeBaseState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.projects));
}

@override
String toString() {
  final _this = this as WelcomeBaseState;
  return 'WelcomeBaseState(projects: ${_this.projects})';
}


}

/// @nodoc
abstract mixin class $WelcomeBaseStateCopyWith<$Res>  {
  factory $WelcomeBaseStateCopyWith(WelcomeBaseState value, $Res Function(WelcomeBaseState) _then) = _$WelcomeBaseStateCopyWithImpl;
@useResult
$Res call({
 List<Project> projects
});




}
/// @nodoc
class _$WelcomeBaseStateCopyWithImpl<$Res>
    implements $WelcomeBaseStateCopyWith<$Res> {
  _$WelcomeBaseStateCopyWithImpl(this._self, this._then);

  final WelcomeBaseState _self;
  final $Res Function(WelcomeBaseState) _then;

/// Create a copy of WelcomeBaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,}) {
  return _then(WelcomeBaseState.state(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeBaseState].
extension WelcomeBaseStatePatterns on WelcomeBaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WelcomeState value)?  state,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WelcomeState() when state != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WelcomeState value)  state,}){
final _that = this;
switch (_that) {
case WelcomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WelcomeState value)?  state,}){
final _that = this;
switch (_that) {
case WelcomeState() when state != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Project> projects)?  state,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WelcomeState() when state != null:
return state(_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Project> projects)  state,}) {final _that = this;
switch (_that) {
case WelcomeState():
return state(_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Project> projects)?  state,}) {final _that = this;
switch (_that) {
case WelcomeState() when state != null:
return state(_that.projects);case _:
  return null;

}
}

}

/// @nodoc


class WelcomeState implements WelcomeBaseState {
  const WelcomeState({ List<Project> projects = const []}): _projects = projects;
  

 final  List<Project> _projects;
@override@JsonKey() List<Project> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of WelcomeBaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeStateCopyWith<WelcomeState> get copyWith => _$WelcomeStateCopyWithImpl<WelcomeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeState&&const DeepCollectionEquality().equals(other.projects, _projects));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));
}

@override
String toString() {
    return 'WelcomeBaseState.state(projects: $projects)';
}


}

/// @nodoc
abstract mixin class $WelcomeStateCopyWith<$Res> implements $WelcomeBaseStateCopyWith<$Res> {
  factory $WelcomeStateCopyWith(WelcomeState value, $Res Function(WelcomeState) _then) = _$WelcomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<Project> projects
});




}
/// @nodoc
class _$WelcomeStateCopyWithImpl<$Res>
    implements $WelcomeStateCopyWith<$Res> {
  _$WelcomeStateCopyWithImpl(this._self, this._then);

  final WelcomeState _self;
  final $Res Function(WelcomeState) _then;

/// Create a copy of WelcomeBaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(WelcomeState(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,
  ));
}


}

// dart format on
