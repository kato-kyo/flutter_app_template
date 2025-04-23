import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_form_state.freezed.dart';

/// タスクフォームの状態
///
/// タスク登録・編集フォームの入力値や状態を管理するクラス。
/// Immutableで設計されており、copyWithメソッドで新しいインスタンスを生成する。
@freezed
class TaskFormState with _$TaskFormState {
  const factory TaskFormState({
    /// タスク名
    @Default('') String name,

    /// 繰り返しタイプ ('daily'または'weekly')
    @Default('daily') String repeatType,

    /// カテゴリID（オプション）
    String? categoryId,

    /// リマインダー時刻（オプション）
    TimeOfDay? reminderTime,

    /// 送信中かどうか
    @Default(false) bool isSubmitting,

    /// エラーメッセージ（エラーがある場合）
    String? errorMessage,
  }) = _TaskFormState;

  /// カスタムメソッド（freezedでは別に定義）
  const TaskFormState._();

  /// カテゴリIDをクリア
  ///
  /// カテゴリの選択を解除する場合に使用する。
  TaskFormState clearCategoryId() {
    return copyWith(categoryId: null);
  }

  /// リマインダー時刻をクリア
  ///
  /// リマインダー時刻の設定を解除する場合に使用する。
  TaskFormState clearReminderTime() {
    return copyWith(reminderTime: null);
  }

  /// エラーメッセージをクリア
  ///
  /// エラー状態をリセットする場合に使用する。
  TaskFormState clearError() {
    return copyWith(errorMessage: null);
  }
}

/// タスクフォームの状態を管理するProvider
///
/// TaskFormStateのインスタンスを提供し、UIからの入力に応じて状態を更新する。
final taskFormStateProvider = StateProvider<TaskFormState>((ref) {
  return const TaskFormState();
});
