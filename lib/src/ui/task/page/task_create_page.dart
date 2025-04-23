import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/task_form.dart';

/// タスク登録画面のルート定数
class TaskCreatePageRoute {
  /// タスク作成画面のパス
  static const path = '/task/create';

  /// タスク作成画面の名前
  static const name = 'taskCreate';
}

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
      appBar: AppBar(
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
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TaskForm(),
        ),
      ),
    );
  }

  /// ヘルプダイアログを表示
  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const _DialogTitle(),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                _HelpItem(
                  title: 'タスク名',
                  description: '毎日または毎週繰り返し行うタスクの名前を入力します。',
                  icon: Icons.edit,
                ),
                SizedBox(height: 12),
                _HelpItem(
                  title: '繰り返しタイプ',
                  description: '「毎日」または「毎週」から選択します。毎週の場合は、登録した曜日に表示されます。',
                  icon: Icons.repeat,
                ),
                SizedBox(height: 12),
                _HelpItem(
                  title: 'リマインダー時刻',
                  description: 'タスクを実行する時刻を設定することで、その時刻に通知でお知らせします。',
                  icon: Icons.notifications,
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
}

/// ダイアログのタイトル部分を構築するウィジェット
class _DialogTitle extends StatelessWidget {
  const _DialogTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.help_outline, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        const Text('タスク登録について'),
      ],
    );
  }
}

/// ヘルプ項目のウィジェット
class _HelpItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _HelpItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
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
