import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'task_id.freezed.dart';

/// タスクIDを表現する値オブジェクト
@freezed
class TaskId with _$TaskId {
  /// プライベートコンストラクタ
  const factory TaskId({required String value}) = _TaskId;

  /// 文字列からTaskIdを生成
  factory TaskId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('TaskId cannot be empty');
    }
    return TaskId(value: value);
  }

  /// 新規TaskIdを生成
  static TaskId generate() {
    return TaskId(value: const Uuid().v4());
  }

  /// カスタムメソッド用コンストラクタ
  const TaskId._();

  @override
  String toString() => 'TaskId($value)';
}
