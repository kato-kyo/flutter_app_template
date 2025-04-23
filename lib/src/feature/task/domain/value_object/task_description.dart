import '../../../../core/util/result.dart';

/// タスクの説明を表現する値オブジェクト
class TaskDescription {
  final String value;

  const TaskDescription._(this.value);

  /// タスクの説明を検証して生成
  static Result<TaskDescription> create(String input) {
    final trimmedInput = input.trim();

    if (trimmedInput.length > 1000) {
      return Result.failure(DomainError('タスクの説明は1000文字以内で入力してください'));
    }

    return Result.success(TaskDescription._(trimmedInput));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDescription && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    if (value.isEmpty) {
      return 'TaskDescription()';
    }
    return 'TaskDescription($value)';
  }
}
