import '../../../../core/util/result.dart';
import '../entity/task.dart';
import '../value_object/category_id.dart';
import '../value_object/repeat_type.dart';
import '../value_object/task_id.dart';

/// タスクリポジトリのインターフェース
abstract class TaskRepository {
  /// タスクをIDで取得
  Future<Result<Task>> getById(TaskId id);

  /// 全タスクを取得
  Future<Result<List<Task>>> getAll();

  /// タスクを条件で取得
  /// [repeatType]と[categoryId]でフィルタリングできる
  Future<Result<List<Task>>> getTasks({
    RepeatType? repeatType,
    CategoryId? categoryId,
  });

  /// タスクを保存（新規作成または更新）
  Future<Result<void>> save(Task task);

  /// タスクを削除
  Future<Result<void>> delete(TaskId id);

  /// タスクの完了状態を記録
  /// [taskId]、[date]、[isCompleted]を指定
  Future<Result<void>> saveCompletionStatus({
    required TaskId taskId,
    required DateTime date,
    required bool isCompleted,
  });

  /// タスクの完了状態を取得
  /// [taskId]と[date]を指定
  Future<Result<bool>> getCompletionStatus({
    required TaskId taskId,
    required DateTime date,
  });

  /// 日付に対する全タスクの完了状態を取得
  /// [date]を指定
  Future<Result<Map<String, bool>>> getCompletionStatusByDate(DateTime date);
}
