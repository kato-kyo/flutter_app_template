// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskFormState {
  /// タスク名
  String get name => throw _privateConstructorUsedError;

  /// 繰り返しタイプ ('daily'または'weekly')
  String get repeatType => throw _privateConstructorUsedError;

  /// カテゴリID（オプション）
  String? get categoryId => throw _privateConstructorUsedError;

  /// リマインダー時刻（オプション）
  TimeOfDay? get reminderTime => throw _privateConstructorUsedError;

  /// 送信中かどうか
  bool get isSubmitting => throw _privateConstructorUsedError;

  /// エラーメッセージ（エラーがある場合）
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskFormStateCopyWith<TaskFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFormStateCopyWith<$Res> {
  factory $TaskFormStateCopyWith(
    TaskFormState value,
    $Res Function(TaskFormState) then,
  ) = _$TaskFormStateCopyWithImpl<$Res, TaskFormState>;
  @useResult
  $Res call({
    String name,
    String repeatType,
    String? categoryId,
    TimeOfDay? reminderTime,
    bool isSubmitting,
    String? errorMessage,
  });
}

/// @nodoc
class _$TaskFormStateCopyWithImpl<$Res, $Val extends TaskFormState>
    implements $TaskFormStateCopyWith<$Res> {
  _$TaskFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? repeatType = null,
    Object? categoryId = freezed,
    Object? reminderTime = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            repeatType:
                null == repeatType
                    ? _value.repeatType
                    : repeatType // ignore: cast_nullable_to_non_nullable
                        as String,
            categoryId:
                freezed == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            reminderTime:
                freezed == reminderTime
                    ? _value.reminderTime
                    : reminderTime // ignore: cast_nullable_to_non_nullable
                        as TimeOfDay?,
            isSubmitting:
                null == isSubmitting
                    ? _value.isSubmitting
                    : isSubmitting // ignore: cast_nullable_to_non_nullable
                        as bool,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskFormStateImplCopyWith<$Res>
    implements $TaskFormStateCopyWith<$Res> {
  factory _$$TaskFormStateImplCopyWith(
    _$TaskFormStateImpl value,
    $Res Function(_$TaskFormStateImpl) then,
  ) = __$$TaskFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String repeatType,
    String? categoryId,
    TimeOfDay? reminderTime,
    bool isSubmitting,
    String? errorMessage,
  });
}

/// @nodoc
class __$$TaskFormStateImplCopyWithImpl<$Res>
    extends _$TaskFormStateCopyWithImpl<$Res, _$TaskFormStateImpl>
    implements _$$TaskFormStateImplCopyWith<$Res> {
  __$$TaskFormStateImplCopyWithImpl(
    _$TaskFormStateImpl _value,
    $Res Function(_$TaskFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? repeatType = null,
    Object? categoryId = freezed,
    Object? reminderTime = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$TaskFormStateImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        repeatType:
            null == repeatType
                ? _value.repeatType
                : repeatType // ignore: cast_nullable_to_non_nullable
                    as String,
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        reminderTime:
            freezed == reminderTime
                ? _value.reminderTime
                : reminderTime // ignore: cast_nullable_to_non_nullable
                    as TimeOfDay?,
        isSubmitting:
            null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                    as bool,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$TaskFormStateImpl extends _TaskFormState {
  const _$TaskFormStateImpl({
    this.name = '',
    this.repeatType = 'daily',
    this.categoryId,
    this.reminderTime,
    this.isSubmitting = false,
    this.errorMessage,
  }) : super._();

  /// タスク名
  @override
  @JsonKey()
  final String name;

  /// 繰り返しタイプ ('daily'または'weekly')
  @override
  @JsonKey()
  final String repeatType;

  /// カテゴリID（オプション）
  @override
  final String? categoryId;

  /// リマインダー時刻（オプション）
  @override
  final TimeOfDay? reminderTime;

  /// 送信中かどうか
  @override
  @JsonKey()
  final bool isSubmitting;

  /// エラーメッセージ（エラーがある場合）
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TaskFormState(name: $name, repeatType: $repeatType, categoryId: $categoryId, reminderTime: $reminderTime, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFormStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.repeatType, repeatType) ||
                other.repeatType == repeatType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.reminderTime, reminderTime) ||
                other.reminderTime == reminderTime) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    repeatType,
    categoryId,
    reminderTime,
    isSubmitting,
    errorMessage,
  );

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFormStateImplCopyWith<_$TaskFormStateImpl> get copyWith =>
      __$$TaskFormStateImplCopyWithImpl<_$TaskFormStateImpl>(this, _$identity);
}

abstract class _TaskFormState extends TaskFormState {
  const factory _TaskFormState({
    final String name,
    final String repeatType,
    final String? categoryId,
    final TimeOfDay? reminderTime,
    final bool isSubmitting,
    final String? errorMessage,
  }) = _$TaskFormStateImpl;
  const _TaskFormState._() : super._();

  /// タスク名
  @override
  String get name;

  /// 繰り返しタイプ ('daily'または'weekly')
  @override
  String get repeatType;

  /// カテゴリID（オプション）
  @override
  String? get categoryId;

  /// リマインダー時刻（オプション）
  @override
  TimeOfDay? get reminderTime;

  /// 送信中かどうか
  @override
  bool get isSubmitting;

  /// エラーメッセージ（エラーがある場合）
  @override
  String? get errorMessage;

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskFormStateImplCopyWith<_$TaskFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
