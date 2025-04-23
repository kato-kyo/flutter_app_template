import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/task_form_state.dart';

/// タスク作成・編集用フォーム
///
/// タスク名、繰り返しタイプ、リマインダー時刻（オプション）の
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
          if (state.errorMessage != null)
            _ErrorMessage(errorMessage: state.errorMessage!),
          _TaskNameField(
            controller: _nameController,
            onChanged: (value) {
              ref
                  .read(taskFormStateProvider.notifier)
                  .update((state) => state.copyWith(name: value));
            },
          ),
          const SizedBox(height: 24),
          _RepeatTypeField(
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
          const SizedBox(height: 24),
          _ReminderTimeField(
            reminderTime: state.reminderTime,
            onSelectTime: _selectTime,
            onClearTime: () {
              ref
                  .read(taskFormStateProvider.notifier)
                  .update((state) => state.clearReminderTime());
            },
          ),
          const SizedBox(height: 36),
          _SaveButton(
            isSubmitting: state.isSubmitting,
            onPressed: state.isSubmitting ? null : _saveTask,
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }

  /// 時刻選択ダイアログを表示
  Future<void> _selectTime() async {
    final state = ref.read(taskFormStateProvider);
    final initialTime = state.reminderTime ?? TimeOfDay.now();

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      ref
          .read(taskFormStateProvider.notifier)
          .update((state) => state.copyWith(reminderTime: pickedTime));
    }
  }

  /// タスクを保存する処理
  Future<void> _saveTask() async {
    // バリデーションチェック
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 送信中の状態に更新
    ref
        .read(taskFormStateProvider.notifier)
        .update((state) => state.copyWith(isSubmitting: true));

    try {
      // TODO: 実際の保存処理をここに実装
      // 仮の処理として1秒待機
      await Future.delayed(const Duration(seconds: 1));

      // 保存成功後の処理
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('タスクを登録しました')));
      }
    } catch (e) {
      // エラー発生時はエラーメッセージを表示
      ref
          .read(taskFormStateProvider.notifier)
          .update(
            (state) => state.copyWith(
              isSubmitting: false,
              errorMessage: 'タスクの登録に失敗しました: ${e.toString()}',
            ),
          );
    } finally {
      // 最終的に送信中フラグをリセット
      if (mounted) {
        ref
            .read(taskFormStateProvider.notifier)
            .update((state) => state.copyWith(isSubmitting: false));
      }
    }
  }
}

/// エラーメッセージ表示ウィジェット
class _ErrorMessage extends StatelessWidget {
  final String errorMessage;

  const _ErrorMessage({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              errorMessage,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
        ],
      ),
    );
  }
}

/// タスク名入力フィールド
class _TaskNameField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const _TaskNameField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'タスク名',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: '例: 朝のストレッチ',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          onChanged: onChanged,
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
    );
  }
}

/// 繰り返しタイプ選択フィールド
class _RepeatTypeField extends StatelessWidget {
  final String value;
  final List<DropdownMenuItem<String>> items;
  final Function(String?) onChanged;

  const _RepeatTypeField({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          value: value,
          items: items,
          onChanged: onChanged,
        ),
        const SizedBox(height: 4),
        Text(
          value == 'daily' ? '毎日のタスクとして登録します' : '毎週同じ曜日に繰り返すタスクとして登録します',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

/// リマインダー時刻選択フィールド
class _ReminderTimeField extends StatelessWidget {
  final TimeOfDay? reminderTime;
  final VoidCallback onSelectTime;
  final VoidCallback onClearTime;

  const _ReminderTimeField({
    required this.reminderTime,
    required this.onSelectTime,
    required this.onClearTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'リマインダー時刻（任意）',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onSelectTime,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    reminderTime != null
                        ? '${reminderTime!.hour.toString().padLeft(2, '0')}:${reminderTime!.minute.toString().padLeft(2, '0')}'
                        : '時刻を設定する（任意）',
                  ),
                ),
                if (reminderTime != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: onClearTime,
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
    );
  }
}

/// 保存ボタン
class _SaveButton extends StatelessWidget {
  final bool isSubmitting;
  final VoidCallback? onPressed;

  const _SaveButton({required this.isSubmitting, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.primary,
          disabledBackgroundColor: Colors.grey.shade300,
        ),
        child:
            isSubmitting
                ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                : const Text(
                  '保存する',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
      ),
    );
  }
}
