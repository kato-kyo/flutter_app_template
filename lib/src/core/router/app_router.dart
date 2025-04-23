import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/task/page/task_create_page.dart';

/// アプリケーションのルート定義
abstract class AppRoutes {
  /// タスク作成画面
  static const taskCreate = TaskCreatePageRoute.path;
}

/// アプリケーションのルーター構成を提供するProvider
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.taskCreate,
    debugLogDiagnostics: true,
    routes: [
      // タスク作成画面
      GoRoute(
        path: TaskCreatePageRoute.path,
        name: TaskCreatePageRoute.name,
        builder: (context, state) => const TaskCreatePage(),
      ),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          appBar: AppBar(title: const Text('ページが見つかりません')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'お探しのページは存在しないか、移動しました。',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.go(AppRoutes.taskCreate),
                  child: const Text('タスク登録に戻る'),
                ),
              ],
            ),
          ),
        ),
  );
});
