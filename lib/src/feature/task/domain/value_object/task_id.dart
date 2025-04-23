import 'package:uuid/uuid.dart';

/// タスクIDを表現する値オブジェクト
class TaskId {
  final String value;

  const TaskId._(this.value);

  /// 文字列からTaskIdを生成
  factory TaskId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('TaskId cannot be empty');
    }
    return TaskId._(value);
  }

  /// 新規TaskIdを生成
  static TaskId generate() {
    return TaskId._(const Uuid().v4());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TaskId && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'TaskId($value)';
}
