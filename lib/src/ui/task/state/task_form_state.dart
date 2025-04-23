import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスクフォームの状態
class TaskFormState {
  final String name;
  final String repeatType;
  final String? categoryId;
  final TimeOfDay? reminderTime;
  final bool isSubmitting;
  final String? errorMessage;

  TaskFormState({
    this.name = '',
    this.repeatType = 'daily',
    this.categoryId,
    this.reminderTime,
    this.isSubmitting = false,
    this.errorMessage,
  });

  /// 新しい状態を生成
  TaskFormState copyWith({
    String? name,
    String? repeatType,
    String? categoryId,
    TimeOfDay? reminderTime,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return TaskFormState(
      name: name ?? this.name,
      repeatType: repeatType ?? this.repeatType,
      categoryId: categoryId ?? this.categoryId,
      reminderTime: reminderTime ?? this.reminderTime,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  /// カテゴリIDをクリア
  TaskFormState clearCategoryId() {
    return copyWith(categoryId: null);
  }

  /// リマインダー時刻をクリア
  TaskFormState clearReminderTime() {
    return copyWith(reminderTime: null);
  }

  /// エラーメッセージをクリア
  TaskFormState clearError() {
    return copyWith(errorMessage: null);
  }
}

/// タスクフォームの状態を管理するProvider
final taskFormStateProvider = StateProvider<TaskFormState>((ref) {
  return TaskFormState();
});
