import '../../../../core/util/result.dart';

/// タスク名を表現する値オブジェクト
class TaskName {
  final String value;

  const TaskName._(this.value);

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

    return Result.success(TaskName._(input.trim()));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TaskName && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'TaskName($value)';
}
