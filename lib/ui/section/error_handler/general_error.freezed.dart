// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'general_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GeneralError {
  String? get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  dynamic get cause => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralErrorCopyWith<GeneralError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralErrorCopyWith<$Res> {
  factory $GeneralErrorCopyWith(
          GeneralError value, $Res Function(GeneralError) then) =
      _$GeneralErrorCopyWithImpl<$Res>;
  $Res call({String? title, String description, dynamic cause});
}

/// @nodoc
class _$GeneralErrorCopyWithImpl<$Res> implements $GeneralErrorCopyWith<$Res> {
  _$GeneralErrorCopyWithImpl(this._value, this._then);

  final GeneralError _value;
  // ignore: unused_field
  final $Res Function(GeneralError) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? cause = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cause: cause == freezed
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_GeneralErrorCopyWith<$Res>
    implements $GeneralErrorCopyWith<$Res> {
  factory _$$_GeneralErrorCopyWith(
          _$_GeneralError value, $Res Function(_$_GeneralError) then) =
      __$$_GeneralErrorCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String description, dynamic cause});
}

/// @nodoc
class __$$_GeneralErrorCopyWithImpl<$Res>
    extends _$GeneralErrorCopyWithImpl<$Res>
    implements _$$_GeneralErrorCopyWith<$Res> {
  __$$_GeneralErrorCopyWithImpl(
      _$_GeneralError _value, $Res Function(_$_GeneralError) _then)
      : super(_value, (v) => _then(v as _$_GeneralError));

  @override
  _$_GeneralError get _value => super._value as _$_GeneralError;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? cause = freezed,
  }) {
    return _then(_$_GeneralError(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cause: cause == freezed
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_GeneralError with DiagnosticableTreeMixin implements _GeneralError {
  const _$_GeneralError({this.title, required this.description, this.cause});

  @override
  final String? title;
  @override
  final String description;
  @override
  final dynamic cause;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeneralError(title: $title, description: $description, cause: $cause)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeneralError'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('cause', cause));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralError &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.cause, cause));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(cause));

  @JsonKey(ignore: true)
  @override
  _$$_GeneralErrorCopyWith<_$_GeneralError> get copyWith =>
      __$$_GeneralErrorCopyWithImpl<_$_GeneralError>(this, _$identity);
}

abstract class _GeneralError implements GeneralError {
  const factory _GeneralError(
      {final String? title,
      required final String description,
      final dynamic cause}) = _$_GeneralError;

  @override
  String? get title;
  @override
  String get description;
  @override
  dynamic get cause;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralErrorCopyWith<_$_GeneralError> get copyWith =>
      throw _privateConstructorUsedError;
}
