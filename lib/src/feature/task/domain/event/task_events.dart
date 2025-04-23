import '../value_object/task_id.dart';

/// タスク作成イベント
class TaskCreatedEvent {
  /// イベント発生日時
  final DateTime occurredOn;

  /// タスクID
  final TaskId taskId;

  /// コンストラクタ
  const TaskCreatedEvent({required this.occurredOn, required this.taskId});
}

/// タスク更新イベント
class TaskUpdatedEvent {
  /// イベント発生日時
  final DateTime occurredOn;

  /// タスクID
  final TaskId taskId;

  /// コンストラクタ
  const TaskUpdatedEvent({required this.occurredOn, required this.taskId});
}

/// タスク削除イベント
class TaskDeletedEvent {
  /// イベント発生日時
  final DateTime occurredOn;

  /// タスクID
  final TaskId taskId;

  /// コンストラクタ
  const TaskDeletedEvent({required this.occurredOn, required this.taskId});
}

/// タスク完了状態変更イベント
class TaskCompletionStatusChangedEvent {
  /// イベント発生日時
  final DateTime occurredOn;

  /// タスクID
  final TaskId taskId;

  /// 対象日付
  final DateTime date;

  /// 完了状態
  final bool isCompleted;

  /// コンストラクタ
  const TaskCompletionStatusChangedEvent({
    required this.occurredOn,
    required this.taskId,
    required this.date,
    required this.isCompleted,
  });
}
