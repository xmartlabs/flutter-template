// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'welcome_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WelcomeBaseState {
  List<Project> get projects => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Project> projects) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Project> projects)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Project> projects)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WelcomeState value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WelcomeState value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WelcomeState value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WelcomeBaseStateCopyWith<WelcomeBaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeBaseStateCopyWith<$Res> {
  factory $WelcomeBaseStateCopyWith(
          WelcomeBaseState value, $Res Function(WelcomeBaseState) then) =
      _$WelcomeBaseStateCopyWithImpl<$Res>;
  $Res call({List<Project> projects});
}

/// @nodoc
class _$WelcomeBaseStateCopyWithImpl<$Res>
    implements $WelcomeBaseStateCopyWith<$Res> {
  _$WelcomeBaseStateCopyWithImpl(this._value, this._then);

  final WelcomeBaseState _value;
  // ignore: unused_field
  final $Res Function(WelcomeBaseState) _then;

  @override
  $Res call({
    Object? projects = freezed,
  }) {
    return _then(_value.copyWith(
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }
}

/// @nodoc
abstract class _$$WelcomeStateCopyWith<$Res>
    implements $WelcomeBaseStateCopyWith<$Res> {
  factory _$$WelcomeStateCopyWith(
          _$WelcomeState value, $Res Function(_$WelcomeState) then) =
      __$$WelcomeStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Project> projects});
}

/// @nodoc
class __$$WelcomeStateCopyWithImpl<$Res>
    extends _$WelcomeBaseStateCopyWithImpl<$Res>
    implements _$$WelcomeStateCopyWith<$Res> {
  __$$WelcomeStateCopyWithImpl(
      _$WelcomeState _value, $Res Function(_$WelcomeState) _then)
      : super(_value, (v) => _then(v as _$WelcomeState));

  @override
  _$WelcomeState get _value => super._value as _$WelcomeState;

  @override
  $Res call({
    Object? projects = freezed,
  }) {
    return _then(_$WelcomeState(
      projects: projects == freezed
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
    ));
  }
}

/// @nodoc

class _$WelcomeState implements WelcomeState {
  const _$WelcomeState({final List<Project> projects = const []})
      : _projects = projects;

  final List<Project> _projects;
  @override
  @JsonKey()
  List<Project> get projects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  String toString() {
    return 'WelcomeBaseState.state(projects: $projects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WelcomeState &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_projects));

  @JsonKey(ignore: true)
  @override
  _$$WelcomeStateCopyWith<_$WelcomeState> get copyWith =>
      __$$WelcomeStateCopyWithImpl<_$WelcomeState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Project> projects) state,
  }) {
    return state(projects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Project> projects)? state,
  }) {
    return state?.call(projects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Project> projects)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(projects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WelcomeState value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WelcomeState value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WelcomeState value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class WelcomeState implements WelcomeBaseState {
  const factory WelcomeState({final List<Project> projects}) = _$WelcomeState;

  @override
  List<Project> get projects;
  @override
  @JsonKey(ignore: true)
  _$$WelcomeStateCopyWith<_$WelcomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
