import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/task_form_state.dart';

/// タスク作成・編集用フォーム
///
/// タスク名、繰り返しタイプ、カテゴリ（オプション）、リマインダー時刻（オプション）の
/// 入力フィールドを提供するフォームウィジェット。
class TaskForm extends ConsumerStatefulWidget {
  const TaskForm({super.key});

  @override
  ConsumerState<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  // 繰り返しタイプの選択肢
  final _repeatTypes = const [
    DropdownMenuItem(value: 'daily', child: Text('毎日')),
    DropdownMenuItem(value: 'weekly', child: Text('毎週')),
  ];

  @override
  void initState() {
    super.initState();
    // 初期値をコントローラーに設定
    final state = ref.read(taskFormStateProvider);
    _nameController.text = state.name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 状態を監視
    final state = ref.watch(taskFormStateProvider);

    return Form(
      key: _formKey,
      child: ListView(
        children: [
          // エラーメッセージ（あれば表示）
          if (state.errorMessage != null)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      state.errorMessage!,
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  ),
                ],
              ),
            ),

          // タスク名入力フィールド
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'タスク名',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: '例: 朝のストレッチ',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                onChanged: (value) {
                  ref
                      .read(taskFormStateProvider.notifier)
                      .update((state) => state.copyWith(name: value));
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'タスク名を入力してください';
                  }
                  if (value.length > 50) {
                    return 'タスク名は50文字以内で入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Text(
                '毎日または毎週繰り返すタスクを入力します（50文字以内）',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 繰り返しタイプ選択
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '繰り返しタイプ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                value: state.repeatType,
                items: _repeatTypes,
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(taskFormStateProvider.notifier)
                        .update((state) => state.copyWith(repeatType: value));
                  }
                },
              ),
              const SizedBox(height: 4),
              Text(
                state.repeatType == 'daily'
                    ? '毎日のタスクとして登録します'
                    : '毎週同じ曜日に繰り返すタスクとして登録します',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // リマインダー時刻選択
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'リマインダー時刻（任意）',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _selectTime,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue.shade700),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          state.reminderTime != null
                              ? '${state.reminderTime!.hour.toString().padLeft(2, '0')}:${state.reminderTime!.minute.toString().padLeft(2, '0')}'
                              : '時刻を設定する（任意）',
                        ),
                      ),
                      if (state.reminderTime != null)
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            ref
                                .read(taskFormStateProvider.notifier)
                                .update((state) => state.clearReminderTime());
                          },
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '設定した時刻に通知でリマインドします',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 36),

          // 保存ボタン
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: state.isSubmitting ? null : _saveTask,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              child:
                  state.isSubmitting
                      ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                      : const Text(
                        '保存する',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }

  /// 時刻選択ダイアログを表示
  Future<void> _selectTime() async {
    final state = ref.read(taskFormStateProvider);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: state.reminderTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      ref
          .read(taskFormStateProvider.notifier)
          .update((state) => state.copyWith(reminderTime: picked));
    }
  }

  /// タスクを保存
  void _saveTask() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: タスク保存処理の実装（domain/data層実装後）

      // 一時的に送信中状態に設定
      ref
          .read(taskFormStateProvider.notifier)
          .update((state) => state.copyWith(isSubmitting: true));

      // 実際のAPI呼び出しは将来的に実装
      Future.delayed(const Duration(seconds: 1), () {
        ref
            .read(taskFormStateProvider.notifier)
            .update(
              (state) => state.copyWith(
                isSubmitting: false,
                // TODO: エラーハンドリングは将来的に実装
              ),
            );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('まだ保存機能は実装されていません'),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
  }
}
