import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/util/result.dart';

part 'task_description.freezed.dart';

/// タスクの説明を表現する値オブジェクト
@freezed
class TaskDescription with _$TaskDescription {
  /// プライベートコンストラクタ
  const factory TaskDescription({required String value}) = _TaskDescription;

  /// タスクの説明を検証して生成
  static Result<TaskDescription> create(String input) {
    final trimmedInput = input.trim();

    if (trimmedInput.length > 1000) {
      return Result.failure(DomainError('タスクの説明は1000文字以内で入力してください'));
    }

    return Result.success(TaskDescription(value: trimmedInput));
  }

  /// カスタムメソッド用コンストラクタ
  const TaskDescription._();

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
