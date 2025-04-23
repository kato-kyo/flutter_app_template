import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/ui/task/page/task_create_page.dart';

Future<void> main() async {
  // Flutterバインディングの初期化
  WidgetsFlutterBinding.ensureInitialized();

  // Hiveの初期化
  // 引数なしでHiveが内部で適切なストレージパスを解決します
  await Hive.initFlutter();

  // TODO: Open Hive Boxes here

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routine Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const TaskCreatePage(),
    );
  }
}
