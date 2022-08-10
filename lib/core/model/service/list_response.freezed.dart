// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListResponse<T> {
  int get count => throw _privateConstructorUsedError;
  List<T> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListResponseCopyWith<T, ListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResponseCopyWith<T, $Res> {
  factory $ListResponseCopyWith(
          ListResponse<T> value, $Res Function(ListResponse<T>) then) =
      _$ListResponseCopyWithImpl<T, $Res>;
  $Res call({int count, List<T> data});
}

/// @nodoc
class _$ListResponseCopyWithImpl<T, $Res>
    implements $ListResponseCopyWith<T, $Res> {
  _$ListResponseCopyWithImpl(this._value, this._then);

  final ListResponse<T> _value;
  // ignore: unused_field
  final $Res Function(ListResponse<T>) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
abstract class _$$_ListResponseCopyWith<T, $Res>
    implements $ListResponseCopyWith<T, $Res> {
  factory _$$_ListResponseCopyWith(
          _$_ListResponse<T> value, $Res Function(_$_ListResponse<T>) then) =
      __$$_ListResponseCopyWithImpl<T, $Res>;
  @override
  $Res call({int count, List<T> data});
}

/// @nodoc
class __$$_ListResponseCopyWithImpl<T, $Res>
    extends _$ListResponseCopyWithImpl<T, $Res>
    implements _$$_ListResponseCopyWith<T, $Res> {
  __$$_ListResponseCopyWithImpl(
      _$_ListResponse<T> _value, $Res Function(_$_ListResponse<T>) _then)
      : super(_value, (v) => _then(v as _$_ListResponse<T>));

  @override
  _$_ListResponse<T> get _value => super._value as _$_ListResponse<T>;

  @override
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ListResponse<T>(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_ListResponse<T> implements _ListResponse<T> {
  _$_ListResponse({required this.count, required final List<T> data})
      : _data = data;

  @override
  final int count;
  final List<T> _data;
  @override
  List<T> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ListResponse<$T>(count: $count, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListResponse<T> &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_ListResponseCopyWith<T, _$_ListResponse<T>> get copyWith =>
      __$$_ListResponseCopyWithImpl<T, _$_ListResponse<T>>(this, _$identity);
}

abstract class _ListResponse<T> implements ListResponse<T> {
  factory _ListResponse(
      {required final int count,
      required final List<T> data}) = _$_ListResponse<T>;

  @override
  int get count;
  @override
  List<T> get data;
  @override
  @JsonKey(ignore: true)
  _$$_ListResponseCopyWith<T, _$_ListResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
