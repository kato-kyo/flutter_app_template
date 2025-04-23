import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスクフォームの状態
///
/// タスク登録・編集フォームの入力値や状態を管理するクラス。
/// Immutableで設計されており、copyWithメソッドで新しいインスタンスを生成する。
class TaskFormState {
  /// タスク名
  final String name;
  
  /// 繰り返しタイプ ('daily'または'weekly')
  final String repeatType;
  
  /// カテゴリID（オプション）
  final String? categoryId;
  
  /// リマインダー時刻（オプション）
  final TimeOfDay? reminderTime;
  
  /// 送信中かどうか
  final bool isSubmitting;
  
  /// エラーメッセージ（エラーがある場合）
  final String? errorMessage;

  /// コンストラクタ
  TaskFormState({
    this.name = '',
    this.repeatType = 'daily',
    this.categoryId,
    this.reminderTime,
    this.isSubmitting = false,
    this.errorMessage,
  });

  /// 新しい状態を生成
  ///
  /// 現在の状態をベースに、変更したいプロパティのみを指定して新しい状態を生成する。
  /// 指定しなかったプロパティは現在の値がそのまま使用される。
  /// nullableなプロパティの場合、引数がnullの場合は実際にnullが設定される。
  TaskFormState copyWith({
    String? name,
    String? repeatType,
    Object? categoryId = _sentinelValue,
    Object? reminderTime = _sentinelValue,
    bool? isSubmitting,
    Object? errorMessage = _sentinelValue,
  }) {
    return TaskFormState(
      name: name ?? this.name,
      repeatType: repeatType ?? this.repeatType,
      categoryId: _getValueOrNull(categoryId, this.categoryId),
      reminderTime: _getValueOrNull(reminderTime, this.reminderTime),
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: _getValueOrNull(errorMessage, this.errorMessage),
    );
  }

  // センチネル値（値が渡されたかどうかを判定するための特別な値）
  static const _sentinelValue = Object();

  // 値が渡された場合はその値を、渡されなかった場合は元の値を返す
  // センチネル値でない場合、Objectは実際の値型かnullなのでキャストして返す
  static T? _getValueOrNull<T>(Object? value, T? defaultValue) {
    return value == _sentinelValue ? defaultValue : value as T?;
  }

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
  return TaskFormState();
});
