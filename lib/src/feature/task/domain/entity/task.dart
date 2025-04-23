import 'package:flutter/material.dart';

import '../../../../core/util/result.dart';
import '../value_object/category_id.dart';
import '../value_object/repeat_type.dart';
import '../value_object/task_description.dart';
import '../value_object/task_id.dart';
import '../value_object/task_name.dart';

/// タスクエンティティクラス
class Task {
  /// タスクID
  final TaskId id;

  /// タスク名
  final TaskName name;

  /// タスクの説明
  final TaskDescription description;

  /// 繰り返しタイプ
  final RepeatType repeatType;

  /// カテゴリID (任意)
  final CategoryId? categoryId;

  /// リマインダー時刻 (任意)
  final TimeOfDay? reminderTime;

  /// コンストラクタ
  const Task({
    required this.id,
    required this.name,
    required this.description,
    required this.repeatType,
    this.categoryId,
    this.reminderTime,
  });

  /// タスクを検証
  static Result<void> validateTask(
    TaskName name,
    TaskDescription description,
    RepeatType repeatType,
    CategoryId? categoryId,
    TimeOfDay? reminderTime,
  ) {
    // TaskNameは既に検証済み
    // TaskDescriptionは既に検証済み
    // RepeatTypeは列挙型なので値の検証は不要
    // カテゴリIDとリマインダー時刻はnullable

    // 現時点では特に追加のビジネスルールなし
    return Result.success(null);
  }

  /// 新しいタスクを作成
  static Result<Task> create(
    TaskName name,
    TaskDescription description,
    RepeatType repeatType,
    CategoryId? categoryId,
    TimeOfDay? reminderTime,
  ) {
    // ビジネスルールのチェック
    final validationResult = validateTask(
      name,
      description,
      repeatType,
      categoryId,
      reminderTime,
    );
    if (validationResult.isFailure) {
      return Result.failure(validationResult.error);
    }

    // 新しいタスクの作成
    return Result.success(
      Task(
        id: TaskId.generate(),
        name: name,
        description: description,
        repeatType: repeatType,
        categoryId: categoryId,
        reminderTime: reminderTime,
      ),
    );
  }

  /// 名前付きコンストラクタ：既存IDでタスクを再構築
  factory Task.reconstitute({
    required String id,
    required String name,
    String description = '',
    required String repeatTypeStr,
    String? categoryId,
    int? reminderHour,
    int? reminderMinute,
  }) {
    final taskNameResult = TaskName.create(name);
    if (taskNameResult.isFailure) {
      throw taskNameResult.error;
    }

    final taskDescriptionResult = TaskDescription.create(description);
    if (taskDescriptionResult.isFailure) {
      throw taskDescriptionResult.error;
    }

    TimeOfDay? reminder;
    if (reminderHour != null && reminderMinute != null) {
      reminder = TimeOfDay(hour: reminderHour, minute: reminderMinute);
    }

    return Task(
      id: TaskId.fromString(id),
      name: taskNameResult.value,
      description: taskDescriptionResult.value,
      repeatType: RepeatType.fromString(repeatTypeStr),
      categoryId: categoryId != null ? CategoryId.fromString(categoryId) : null,
      reminderTime: reminder,
    );
  }

  /// タスク内容を更新したコピーを作成
  Task copyWith({
    TaskName? name,
    TaskDescription? description,
    RepeatType? repeatType,
    CategoryId? categoryId,
    TimeOfDay? reminderTime,
    bool clearCategoryId = false,
    bool clearReminderTime = false,
  }) {
    return Task(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      repeatType: repeatType ?? this.repeatType,
      categoryId: clearCategoryId ? null : (categoryId ?? this.categoryId),
      reminderTime:
          clearReminderTime ? null : (reminderTime ?? this.reminderTime),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        repeatType == other.repeatType &&
        categoryId == other.categoryId &&
        _compareTimeOfDay(reminderTime, other.reminderTime);
  }

  /// TimeOfDayを比較
  bool _compareTimeOfDay(TimeOfDay? a, TimeOfDay? b) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    return a.hour == b.hour && a.minute == b.minute;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    repeatType,
    categoryId,
    reminderTime != null
        ? '${reminderTime!.hour}:${reminderTime!.minute}'
        : null,
  );
}
