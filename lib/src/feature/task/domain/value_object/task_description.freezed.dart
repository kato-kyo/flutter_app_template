// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_description.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskDescription {
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of TaskDescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskDescriptionCopyWith<TaskDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDescriptionCopyWith<$Res> {
  factory $TaskDescriptionCopyWith(
          TaskDescription value, $Res Function(TaskDescription) then) =
      _$TaskDescriptionCopyWithImpl<$Res, TaskDescription>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$TaskDescriptionCopyWithImpl<$Res, $Val extends TaskDescription>
    implements $TaskDescriptionCopyWith<$Res> {
  _$TaskDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDescription
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
abstract class _$$TaskDescriptionImplCopyWith<$Res>
    implements $TaskDescriptionCopyWith<$Res> {
  factory _$$TaskDescriptionImplCopyWith(_$TaskDescriptionImpl value,
          $Res Function(_$TaskDescriptionImpl) then) =
      __$$TaskDescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$TaskDescriptionImplCopyWithImpl<$Res>
    extends _$TaskDescriptionCopyWithImpl<$Res, _$TaskDescriptionImpl>
    implements _$$TaskDescriptionImplCopyWith<$Res> {
  __$$TaskDescriptionImplCopyWithImpl(
      _$TaskDescriptionImpl _value, $Res Function(_$TaskDescriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskDescription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$TaskDescriptionImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskDescriptionImpl extends _TaskDescription {
  const _$TaskDescriptionImpl({required this.value}) : super._();

  @override
  final String value;

  /// Create a copy of TaskDescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDescriptionImplCopyWith<_$TaskDescriptionImpl> get copyWith =>
      __$$TaskDescriptionImplCopyWithImpl<_$TaskDescriptionImpl>(
          this, _$identity);
}

abstract class _TaskDescription extends TaskDescription {
  const factory _TaskDescription({required final String value}) =
      _$TaskDescriptionImpl;
  const _TaskDescription._() : super._();

  @override
  String get value;

  /// Create a copy of TaskDescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDescriptionImplCopyWith<_$TaskDescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
