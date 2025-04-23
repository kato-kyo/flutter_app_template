// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskId {
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of TaskId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskIdCopyWith<TaskId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskIdCopyWith<$Res> {
  factory $TaskIdCopyWith(TaskId value, $Res Function(TaskId) then) =
      _$TaskIdCopyWithImpl<$Res, TaskId>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$TaskIdCopyWithImpl<$Res, $Val extends TaskId>
    implements $TaskIdCopyWith<$Res> {
  _$TaskIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskIdImplCopyWith<$Res> implements $TaskIdCopyWith<$Res> {
  factory _$$TaskIdImplCopyWith(
          _$TaskIdImpl value, $Res Function(_$TaskIdImpl) then) =
      __$$TaskIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$TaskIdImplCopyWithImpl<$Res>
    extends _$TaskIdCopyWithImpl<$Res, _$TaskIdImpl>
    implements _$$TaskIdImplCopyWith<$Res> {
  __$$TaskIdImplCopyWithImpl(
      _$TaskIdImpl _value, $Res Function(_$TaskIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$TaskIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskIdImpl extends _TaskId {
  const _$TaskIdImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of TaskId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskIdImplCopyWith<_$TaskIdImpl> get copyWith =>
      __$$TaskIdImplCopyWithImpl<_$TaskIdImpl>(this, _$identity);
}

abstract class _TaskId extends TaskId {
  const factory _TaskId({required final String value}) = _$TaskIdImpl;
  const _TaskId._() : super._();

  @override
  String get value;

  /// Create a copy of TaskId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskIdImplCopyWith<_$TaskIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
