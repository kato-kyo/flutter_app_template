// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Task {
  /// タスクID
  TaskId get id => throw _privateConstructorUsedError;

  /// タスク名
  TaskName get name => throw _privateConstructorUsedError;

  /// タスクの説明
  TaskDescription get description => throw _privateConstructorUsedError;

  /// 繰り返しタイプ
  RepeatType get repeatType => throw _privateConstructorUsedError;

  /// カテゴリID (任意)
  CategoryId? get categoryId => throw _privateConstructorUsedError;

  /// リマインダー時刻 (任意)
  TimeOfDay? get reminderTime => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {TaskId id,
      TaskName name,
      TaskDescription description,
      RepeatType repeatType,
      CategoryId? categoryId,
      TimeOfDay? reminderTime});

  $TaskIdCopyWith<$Res> get id;
  $TaskNameCopyWith<$Res> get name;
  $TaskDescriptionCopyWith<$Res> get description;
  $CategoryIdCopyWith<$Res>? get categoryId;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? repeatType = null,
    Object? categoryId = freezed,
    Object? reminderTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TaskName,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TaskDescription,
      repeatType: null == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as CategoryId?,
      reminderTime: freezed == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ) as $Val);
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskIdCopyWith<$Res> get id {
    return $TaskIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskNameCopyWith<$Res> get name {
    return $TaskNameCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskDescriptionCopyWith<$Res> get description {
    return $TaskDescriptionCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryIdCopyWith<$Res>? get categoryId {
    if (_value.categoryId == null) {
      return null;
    }

    return $CategoryIdCopyWith<$Res>(_value.categoryId!, (value) {
      return _then(_value.copyWith(categoryId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskId id,
      TaskName name,
      TaskDescription description,
      RepeatType repeatType,
      CategoryId? categoryId,
      TimeOfDay? reminderTime});

  @override
  $TaskIdCopyWith<$Res> get id;
  @override
  $TaskNameCopyWith<$Res> get name;
  @override
  $TaskDescriptionCopyWith<$Res> get description;
  @override
  $CategoryIdCopyWith<$Res>? get categoryId;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? repeatType = null,
    Object? categoryId = freezed,
    Object? reminderTime = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TaskName,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as TaskDescription,
      repeatType: null == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as RepeatType,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as CategoryId?,
      reminderTime: freezed == reminderTime
          ? _value.reminderTime
          : reminderTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc

class _$TaskImpl extends _Task {
  const _$TaskImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.repeatType,
      this.categoryId,
      this.reminderTime})
      : super._();

  /// タスクID
  @override
  final TaskId id;

  /// タスク名
  @override
  final TaskName name;

  /// タスクの説明
  @override
  final TaskDescription description;

  /// 繰り返しタイプ
  @override
  final RepeatType repeatType;

  /// カテゴリID (任意)
  @override
  final CategoryId? categoryId;

  /// リマインダー時刻 (任意)
  @override
  final TimeOfDay? reminderTime;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, repeatType: $repeatType, categoryId: $categoryId, reminderTime: $reminderTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.repeatType, repeatType) ||
                other.repeatType == repeatType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.reminderTime, reminderTime) ||
                other.reminderTime == reminderTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, repeatType, categoryId, reminderTime);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task extends Task {
  const factory _Task(
      {required final TaskId id,
      required final TaskName name,
      required final TaskDescription description,
      required final RepeatType repeatType,
      final CategoryId? categoryId,
      final TimeOfDay? reminderTime}) = _$TaskImpl;
  const _Task._() : super._();

  /// タスクID
  @override
  TaskId get id;

  /// タスク名
  @override
  TaskName get name;

  /// タスクの説明
  @override
  TaskDescription get description;

  /// 繰り返しタイプ
  @override
  RepeatType get repeatType;

  /// カテゴリID (任意)
  @override
  CategoryId? get categoryId;

  /// リマインダー時刻 (任意)
  @override
  TimeOfDay? get reminderTime;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
