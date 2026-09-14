// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_event_handler_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GlobalEventHandlerState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerState'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalEventHandlerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GlobalEventHandlerState()';
}


}

/// @nodoc
class $GlobalEventHandlerStateCopyWith<$Res>  {
$GlobalEventHandlerStateCopyWith(GlobalEventHandlerState _, $Res Function(GlobalEventHandlerState) __);
}


/// Adds pattern-matching-related methods to [GlobalEventHandlerState].
extension GlobalEventHandlerStatePatterns on GlobalEventHandlerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IdleGlobalEventHandlerState value)?  idle,TResult Function( ErrorGlobalEventHandlerState value)?  error,TResult Function( LoadingGlobalEventHandlerState value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IdleGlobalEventHandlerState() when idle != null:
return idle(_that);case ErrorGlobalEventHandlerState() when error != null:
return error(_that);case LoadingGlobalEventHandlerState() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IdleGlobalEventHandlerState value)  idle,required TResult Function( ErrorGlobalEventHandlerState value)  error,required TResult Function( LoadingGlobalEventHandlerState value)  loading,}){
final _that = this;
switch (_that) {
case IdleGlobalEventHandlerState():
return idle(_that);case ErrorGlobalEventHandlerState():
return error(_that);case LoadingGlobalEventHandlerState():
return loading(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IdleGlobalEventHandlerState value)?  idle,TResult? Function( ErrorGlobalEventHandlerState value)?  error,TResult? Function( LoadingGlobalEventHandlerState value)?  loading,}){
final _that = this;
switch (_that) {
case IdleGlobalEventHandlerState() when idle != null:
return idle(_that);case ErrorGlobalEventHandlerState() when error != null:
return error(_that);case LoadingGlobalEventHandlerState() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( GlobalEventHandlerStateError error)?  error,TResult Function()?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IdleGlobalEventHandlerState() when idle != null:
return idle();case ErrorGlobalEventHandlerState() when error != null:
return error(_that.error);case LoadingGlobalEventHandlerState() when loading != null:
return loading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( GlobalEventHandlerStateError error)  error,required TResult Function()  loading,}) {final _that = this;
switch (_that) {
case IdleGlobalEventHandlerState():
return idle();case ErrorGlobalEventHandlerState():
return error(_that.error);case LoadingGlobalEventHandlerState():
return loading();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( GlobalEventHandlerStateError error)?  error,TResult? Function()?  loading,}) {final _that = this;
switch (_that) {
case IdleGlobalEventHandlerState() when idle != null:
return idle();case ErrorGlobalEventHandlerState() when error != null:
return error(_that.error);case LoadingGlobalEventHandlerState() when loading != null:
return loading();case _:
  return null;

}
}

}

/// @nodoc


class IdleGlobalEventHandlerState with DiagnosticableTreeMixin implements GlobalEventHandlerState {
  const IdleGlobalEventHandlerState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerState.idle'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is IdleGlobalEventHandlerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GlobalEventHandlerState.idle()';
}


}




/// @nodoc


class ErrorGlobalEventHandlerState with DiagnosticableTreeMixin implements GlobalEventHandlerState {
  const ErrorGlobalEventHandlerState(this.error);
  

 final  GlobalEventHandlerStateError error;

/// Create a copy of GlobalEventHandlerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorGlobalEventHandlerStateCopyWith<ErrorGlobalEventHandlerState> get copyWith => _$ErrorGlobalEventHandlerStateCopyWithImpl<ErrorGlobalEventHandlerState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerState.error'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorGlobalEventHandlerState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GlobalEventHandlerState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorGlobalEventHandlerStateCopyWith<$Res> implements $GlobalEventHandlerStateCopyWith<$Res> {
  factory $ErrorGlobalEventHandlerStateCopyWith(ErrorGlobalEventHandlerState value, $Res Function(ErrorGlobalEventHandlerState) _then) = _$ErrorGlobalEventHandlerStateCopyWithImpl;
@useResult
$Res call({
 GlobalEventHandlerStateError error
});


$GlobalEventHandlerStateErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$ErrorGlobalEventHandlerStateCopyWithImpl<$Res>
    implements $ErrorGlobalEventHandlerStateCopyWith<$Res> {
  _$ErrorGlobalEventHandlerStateCopyWithImpl(this._self, this._then);

  final ErrorGlobalEventHandlerState _self;
  final $Res Function(ErrorGlobalEventHandlerState) _then;

/// Create a copy of GlobalEventHandlerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorGlobalEventHandlerState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as GlobalEventHandlerStateError,
  ));
}

/// Create a copy of GlobalEventHandlerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GlobalEventHandlerStateErrorCopyWith<$Res> get error {
  
  return $GlobalEventHandlerStateErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc


class LoadingGlobalEventHandlerState with DiagnosticableTreeMixin implements GlobalEventHandlerState {
  const LoadingGlobalEventHandlerState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerState.loading'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingGlobalEventHandlerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GlobalEventHandlerState.loading()';
}


}




/// @nodoc
mixin _$GlobalEventHandlerStateError implements DiagnosticableTreeMixin {

 VoidCallback? get retry;
/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalEventHandlerStateErrorCopyWith<GlobalEventHandlerStateError> get copyWith => _$GlobalEventHandlerStateErrorCopyWithImpl<GlobalEventHandlerStateError>(this as GlobalEventHandlerStateError, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as GlobalEventHandlerStateError;
  properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerStateError'))
    ..add(DiagnosticsProperty('retry', _this.retry));
}



@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as GlobalEventHandlerStateError;
  return 'GlobalEventHandlerStateError(retry: ${_this.retry})';
}


}

/// @nodoc
abstract mixin class $GlobalEventHandlerStateErrorCopyWith<$Res>  {
  factory $GlobalEventHandlerStateErrorCopyWith(GlobalEventHandlerStateError value, $Res Function(GlobalEventHandlerStateError) _then) = _$GlobalEventHandlerStateErrorCopyWithImpl;
@useResult
$Res call({
 void Function()? retry
});




}
/// @nodoc
class _$GlobalEventHandlerStateErrorCopyWithImpl<$Res>
    implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  _$GlobalEventHandlerStateErrorCopyWithImpl(this._self, this._then);

  final GlobalEventHandlerStateError _self;
  final $Res Function(GlobalEventHandlerStateError) _then;

/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? retry = freezed,}) {
  return _then(_self.copyWith(
retry: freezed == retry ? _self.retry : retry // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}

}


/// Adds pattern-matching-related methods to [GlobalEventHandlerStateError].
extension GlobalEventHandlerStateErrorPatterns on GlobalEventHandlerStateError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UnknownError value)?  unknownError,TResult Function( InternetError value)?  internetError,TResult Function( GeneralError value)?  generalError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UnknownError() when unknownError != null:
return unknownError(_that);case InternetError() when internetError != null:
return internetError(_that);case GeneralError() when generalError != null:
return generalError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UnknownError value)  unknownError,required TResult Function( InternetError value)  internetError,required TResult Function( GeneralError value)  generalError,}){
final _that = this;
switch (_that) {
case UnknownError():
return unknownError(_that);case InternetError():
return internetError(_that);case GeneralError():
return generalError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UnknownError value)?  unknownError,TResult? Function( InternetError value)?  internetError,TResult? Function( GeneralError value)?  generalError,}){
final _that = this;
switch (_that) {
case UnknownError() when unknownError != null:
return unknownError(_that);case InternetError() when internetError != null:
return internetError(_that);case GeneralError() when generalError != null:
return generalError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Object? error,  VoidCallback? retry)?  unknownError,TResult Function( VoidCallback? retry)?  internetError,TResult Function( String? title,  String description,  VoidCallback? retry)?  generalError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UnknownError() when unknownError != null:
return unknownError(_that.error,_that.retry);case InternetError() when internetError != null:
return internetError(_that.retry);case GeneralError() when generalError != null:
return generalError(_that.title,_that.description,_that.retry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Object? error,  VoidCallback? retry)  unknownError,required TResult Function( VoidCallback? retry)  internetError,required TResult Function( String? title,  String description,  VoidCallback? retry)  generalError,}) {final _that = this;
switch (_that) {
case UnknownError():
return unknownError(_that.error,_that.retry);case InternetError():
return internetError(_that.retry);case GeneralError():
return generalError(_that.title,_that.description,_that.retry);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Object? error,  VoidCallback? retry)?  unknownError,TResult? Function( VoidCallback? retry)?  internetError,TResult? Function( String? title,  String description,  VoidCallback? retry)?  generalError,}) {final _that = this;
switch (_that) {
case UnknownError() when unknownError != null:
return unknownError(_that.error,_that.retry);case InternetError() when internetError != null:
return internetError(_that.retry);case GeneralError() when generalError != null:
return generalError(_that.title,_that.description,_that.retry);case _:
  return null;

}
}

}

/// @nodoc


class UnknownError with DiagnosticableTreeMixin implements GlobalEventHandlerStateError {
  const UnknownError(this.error, [this.retry]);
  

 final  Object? error;
@override final  VoidCallback? retry;

/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownErrorCopyWith<UnknownError> get copyWith => _$UnknownErrorCopyWithImpl<UnknownError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerStateError.unknownError'))
    ..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('retry', retry));
}



@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GlobalEventHandlerStateError.unknownError(error: $error, retry: $retry)';
}


}

/// @nodoc
abstract mixin class $UnknownErrorCopyWith<$Res> implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory $UnknownErrorCopyWith(UnknownError value, $Res Function(UnknownError) _then) = _$UnknownErrorCopyWithImpl;
@override @useResult
$Res call({
 Object? error, VoidCallback? retry
});




}
/// @nodoc
class _$UnknownErrorCopyWithImpl<$Res>
    implements $UnknownErrorCopyWith<$Res> {
  _$UnknownErrorCopyWithImpl(this._self, this._then);

  final UnknownError _self;
  final $Res Function(UnknownError) _then;

/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? retry = freezed,}) {
  return _then(UnknownError(
freezed == error ? _self.error : error ,freezed == retry ? _self.retry : retry // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}


}

/// @nodoc


class InternetError with DiagnosticableTreeMixin implements GlobalEventHandlerStateError {
  const InternetError([this.retry]);
  

@override final  VoidCallback? retry;

/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternetErrorCopyWith<InternetError> get copyWith => _$InternetErrorCopyWithImpl<InternetError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerStateError.internetError'))
    ..add(DiagnosticsProperty('retry', retry));
}



@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GlobalEventHandlerStateError.internetError(retry: $retry)';
}


}

/// @nodoc
abstract mixin class $InternetErrorCopyWith<$Res> implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory $InternetErrorCopyWith(InternetError value, $Res Function(InternetError) _then) = _$InternetErrorCopyWithImpl;
@override @useResult
$Res call({
 VoidCallback? retry
});




}
/// @nodoc
class _$InternetErrorCopyWithImpl<$Res>
    implements $InternetErrorCopyWith<$Res> {
  _$InternetErrorCopyWithImpl(this._self, this._then);

  final InternetError _self;
  final $Res Function(InternetError) _then;

/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retry = freezed,}) {
  return _then(InternetError(
freezed == retry ? _self.retry : retry // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}


}

/// @nodoc


class GeneralError with DiagnosticableTreeMixin implements GlobalEventHandlerStateError {
  const GeneralError(this.title, this.description, [this.retry]);
  

 final  String? title;
 final  String description;
@override final  VoidCallback? retry;

/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralErrorCopyWith<GeneralError> get copyWith => _$GeneralErrorCopyWithImpl<GeneralError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'GlobalEventHandlerStateError.generalError'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('retry', retry));
}



@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'GlobalEventHandlerStateError.generalError(title: $title, description: $description, retry: $retry)';
}


}

/// @nodoc
abstract mixin class $GeneralErrorCopyWith<$Res> implements $GlobalEventHandlerStateErrorCopyWith<$Res> {
  factory $GeneralErrorCopyWith(GeneralError value, $Res Function(GeneralError) _then) = _$GeneralErrorCopyWithImpl;
@override @useResult
$Res call({
 String? title, String description, VoidCallback? retry
});




}
/// @nodoc
class _$GeneralErrorCopyWithImpl<$Res>
    implements $GeneralErrorCopyWith<$Res> {
  _$GeneralErrorCopyWithImpl(this._self, this._then);

  final GeneralError _self;
  final $Res Function(GeneralError) _then;

/// Create a copy of GlobalEventHandlerStateError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = null,Object? retry = freezed,}) {
  return _then(GeneralError(
freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,freezed == retry ? _self.retry : retry // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}


}

// dart format on
