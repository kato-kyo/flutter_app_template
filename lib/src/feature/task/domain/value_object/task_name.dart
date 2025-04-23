import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/util/result.dart';

part 'task_name.freezed.dart';

/// タスク名を表現する値オブジェクト
@freezed
class TaskName with _$TaskName {
  /// プライベートコンストラクタ
  const factory TaskName({required String value}) = _TaskName;

  /// タスク名を検証して生成
  static Result<TaskName> create(String input) {
    // 空文字チェック
    if (input.trim().isEmpty) {
      return Result.failure(DomainError('タスク名を入力してください'));
    }

    // 文字数制限チェック
    if (input.length > 50) {
      return Result.failure(DomainError('タスク名は50文字以内で入力してください'));
    }

    return Result.success(TaskName(value: input.trim()));
  }

  /// カスタムメソッド用コンストラクタ
  const TaskName._();

  @override
  String toString() => 'TaskName($value)';
}
