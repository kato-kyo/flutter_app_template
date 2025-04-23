import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/task_form.dart';

/// タスク登録画面
///
/// ユーザーが新しいタスクを作成するための画面。
/// タスク名、繰り返しタイプ、リマインダー時刻（オプション）を入力できる。
class TaskCreatePage extends ConsumerWidget {
  /// コンストラクタ
  const TaskCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TaskForm(),
        ),
      ),
    );
  }

  /// アプリバーを構築
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('タスク登録'),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: () => _showHelpDialog(context),
          tooltip: 'ヘルプ',
        ),
      ],
    );
  }

  /// ヘルプダイアログを表示
  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: _buildDialogTitle(context),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHelpItem(
                  context,
                  'タスク名',
                  '毎日または毎週繰り返し行うタスクの名前を入力します。',
                  Icons.edit,
                ),
                const SizedBox(height: 12),
                _buildHelpItem(
                  context,
                  '繰り返しタイプ',
                  '「毎日」または「毎週」から選択します。毎週の場合は、登録した曜日に表示されます。',
                  Icons.repeat,
                ),
                const SizedBox(height: 12),
                _buildHelpItem(
                  context,
                  'リマインダー時刻',
                  'タスクを実行する時刻を設定することで、その時刻に通知でお知らせします。',
                  Icons.notifications,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('閉じる'),
            ),
          ],
        );
      },
    );
  }

  /// ダイアログのタイトル部分を構築
  Widget _buildDialogTitle(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.help_outline, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        const Text('タスク登録について'),
      ],
    );
  }

  /// ヘルプ項目のウィジェットを作成
  Widget _buildHelpItem(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
