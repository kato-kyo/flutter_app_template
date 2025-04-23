import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_app_template/main.dart' as app; // アプリのエントリーポイントをインポート

void main() {
  // IntegrationTestWidgetsFlutterBinding を初期化
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Startup Test', () {
    testWidgets('App launches and displays initial text', (tester) async {
      // アプリを起動
      app.main();
      await tester.pumpAndSettle();

      // 初期テキストが表示されていることを確認
      expect(find.text('Hello World!'), findsOneWidget);
    });
  });
}
