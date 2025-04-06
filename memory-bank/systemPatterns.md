# システムパターン: Routine Manager

## 1. システムアーキテクチャ

Flutterの**レイヤードアーキテクチャ (Clean Architecture に類似)** を採用します。これにより、関心事の分離、テスト容易性、保守性の向上を目指します。

```mermaid
graph TD
    UI[UI Layer (Widgets)] --> App[Application Layer (Riverpod, UseCases)]
    App --> Domain[Domain Layer (Entities, Repositories IF)]
    App --> Data[Data Layer (Repositories Impl)]
    Domain --> Data
    Data --> LocalDB[Local Storage (Hive)]

    subgraph Presentation
        UI
    end
    subgraph Logic
        App
        Domain
    end
    subgraph Data
        Data
        LocalDB
    end
```

- **UI Layer:** FlutterのWidgetシステムを利用し、ユーザーインターフェースの構築とユーザー入力の処理を担当します。状態管理のためにApplication LayerのProviderを監視します。
- **Application Layer:** アプリケーション固有のロジック（UseCase）と状態管理（Riverpod Provider/Notifier）を担当します。UIからのイベントを受け取り、Domain LayerやData Layerと連携して処理を実行し、UIに状態を通知します。
- **Domain Layer:** アプリケーションのコアビジネスロジックとドメイン知識（エンティティ、Value Object）を定義します。インフラストラクチャに依存しない純粋なルールを表現します。データアクセスはRepositoryインターフェースを通じて行います。
- **Data Layer:** データ永続化の具体的な実装を担当します。Domain Layerで定義されたRepositoryインターフェースを実装し、ローカルデータベース（Hive）へのアクセスを行います。

**依存関係のルール:** 外側のレイヤーは内側のレイヤーにのみ依存できます（UI → App → Domain）。Data LayerはDomain Layerのインターフェースに依存します。

## 2. 主要な技術的決定

- **フレームワーク:** Flutter (iOS/Androidクロスプラットフォーム開発)
- **状態管理:** Riverpod (宣言的な状態管理、依存性注入)
- **データ永続化:** Hive (ローカルオブジェクトDB、パフォーマンスと使いやすさのバランス)
- **ローカル通知:** flutter_local_notifications (プラットフォームネイティブ通知機能の利用)
- **ルーティング:** (未定、シンプルな場合はNavigator 2.0直書き、複雑化する場合はGoRouter等を検討)
- **ID生成:** UUID (普遍的に一意なID)

## 3. デザインパターン

- **Repositoryパターン:** データアクセスロジックを抽象化し、Domain Layerを永続化技術から分離します。
- **Providerパターン (Riverpod):** 状態の提供と依存性注入を行います。
- **Notifierパターン (Riverpod):** 変更可能な状態を管理し、UIに通知します。
- **Value Object:** 不変で検証済みの値を表現し、ドメインルールの明確化と不正な値の防止に役立てます（例: TaskName, CategoryName）。

## 4. コンポーネントの関係

- 各機能（タスク、カテゴリ、アチーブメント、設定）は、それぞれのレイヤー（UI, App, Domain, Data）に対応するコンポーネントを持ちます。
- Riverpod Providerを通じて、UIとApplication Layerの状態が連携されます。
- Repositoryインターフェースを通じて、Application/Domain LayerとData Layerが疎結合に連携されます。

## 5. クリティカルな実装パス

- **タスク完了状態の管理:** 日付とタスクIDに基づいた完了記録の正確な保存と読み込み。
- **繰り返しタスクの表示ロジック:** 指定された日付に基づいて、その日に表示すべき繰り返しタスク（毎日/週次）を正しく判定するロジック。
- **アチーブメント判定ロジック:** ユーザーの行動（タスク完了など）をトリガーとして、複数のアチーブメント条件を効率的に判定し、獲得状態を更新するロジック。
- **ローカル通知のスケジューリング:** アプリがバックグラウンドや終了状態でも、指定時刻に正確に通知をスケジュール・実行する仕組み。 