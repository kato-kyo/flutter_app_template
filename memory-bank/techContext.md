# 技術コンテキスト: Routine Manager

## 1. 使用技術スタック

- **言語:** Dart (SDK: [Flutterのバージョンに追従])
- **フレームワーク:** Flutter (UIツールキット, クロスプラットフォーム開発)
- **状態管理:** flutter_riverpod
- **ローカルデータベース:** Hive (hive, hive_flutter)
- **ローカル通知:** flutter_local_notifications
- **パス取得:** path_provider (Hive初期化等)
- **ID生成:** uuid
- **日付/時刻処理:** intl
- **ビルドシステム:** Flutter build tools / Gradle (Android) / Xcode build (iOS)
- **バージョン管理:** Git / GitHub

## 2. 開発環境セットアップ

- Flutter SDK のインストール ([公式ドキュメント](https://flutter.dev/docs/get-started/install) 参照)
- 開発用IDE: Visual Studio Code (推奨) または Android Studio
    - 推奨VSCode拡張機能: Dart, Flutter, Awesome Flutter Snippets, Error Lens, Prettier, Material Icon Theme
- 依存関係のインストール: `flutter pub get`
- Hiveアダプター生成: `flutter pub run build_runner build --delete-conflicting-outputs` (コード生成が必要な場合)
- 実行/デバッグ: `flutter run` / IDEのデバッグ機能

## 3. 技術的な制約

- **プラットフォーム:** iOS, Android (MVPではWeb, Desktopは対象外)
- **データ永続化:** MVPではローカルストレージのみ。アプリのアンインストールでデータは消える。
- **バックグラウンド処理:** ローカル通知以外、厳密なバックグラウンド処理はMVPスコープ外（将来的に検討）。
- **外部API連携:** MVPスコープ外。

## 4. 依存関係管理

- `pubspec.yaml` でパッケージとそのバージョンを管理する。
- 定期的に `flutter pub outdated` で更新を確認し、必要に応じて `flutter pub upgrade` を実行する（互換性に注意）。
- バージョン制約はキャレット(`^`)を使用し、互換性のある範囲での自動更新を許容する。

## 5. ツール利用パターン

- **バージョン管理:** GitHub Flow に近いブランチ戦略を採用 (main, develop, feature/*, task/*)。
- **コードフォーマット:** `dart format .` を利用して整形する (IDEの保存時自動フォーマット推奨)。
- **静的解析:** `flutter analyze` を利用してコード品質をチェックする (`analysis_options.yaml` でルールを設定)。
- **テスト:** `flutter test` で単体・ウィジェットテストを実行する。 