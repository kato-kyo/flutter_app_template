# 基本設計書

## アプリケーション概要

- **アプリ名**: Routine Manager
- **プラットフォーム**: iOS/Android (Flutter)
- **対象ユーザー**: 日々のタスクや習慣を効率的に管理したい社会人や学生
- **コンセプト**: 日常のルーティン管理を、誰でも簡単に、楽しく継続できるようにするシンプルなモバイルアプリ

## アーキテクチャ設計

### 全体アーキテクチャ

Flutterのレイヤードアーキテクチャ (Clean Architecture に類似) を採用します。
詳細は `.cursor/rules/021-directory-structure.mdc` を参照してください。

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

### 状態管理

- **主要な状態管理手法**: Riverpod
- **選定理由**: 宣言的な状態管理、依存性注入の容易さ、テスト容易性、Flutterコミュニティでの普及度。

### データフロー

1. ユーザー操作 (例: タスク完了ボタンタップ) → UI Layer (Widget)
2. UI Layer → Application Layer (Notifier/Provider経由でUseCase呼び出し)
3. Application Layer → Domain Layer (必要に応じてEntity操作やRepository IF呼び出し)
4. Domain Layer → Data Layer (Repository IF経由で実装呼び出し)
5. Data Layer → Local Storage (Hive) へデータの永続化
6. 状態変更が Application Layer (Notifier) に反映され、UI Layer が再描画される。

## 機能一覧設計

以下はMVPで実装予定の機能一覧です。各機能に対する技術的な詳細や設計上の考慮点を記載しています。

|機能ID|機能名|実装レイヤー|関連エンティティ|技術的考慮点|画面ID(仮)|
|---|---|---|---|---|---|
|F001|タスク登録|UI, App, Domain, Data|Task, Category|・入力バリデーション<br>・繰り返し種別(日次/週次)の扱い<br>・リマインダー時刻設定<br>・Hiveへの保存|S002|
|F002|タスク編集|UI, App, Domain, Data|Task, Category|・既存データの読み込み<br>・変更差分の保存|S002|
|F003|タスク削除|UI, App, Domain, Data|Task|・削除確認UI<br>・Hiveからの削除|S001, S002|
|F004|タスク一覧表示|UI, App, Domain, Data|Task, Category|・表示期間(当日/週等)の判定ロジック<br>・完了/未完了の視覚的区別<br>・Hiveからの効率的な読み込み|S001|
|F005|タスク完了管理|UI, App, Domain, Data|Task|・完了状態の切り替えロジック<br>・完了日時の記録(Hive)|S001|
|F006|カテゴリ作成|UI, App, Domain, Data|Category|・カテゴリ名の入力<br>・Hiveへの保存|S003|
|F007|カテゴリ編集|UI, App, Domain, Data|Category|・既存データの読み込み<br>・変更差分の保存|S003|
|F008|カテゴリ削除|UI, App, Domain, Data|Category|・削除確認UI<br>・関連タスクのカテゴリID更新処理|S003|
|F010|ローカル通知実行|App, (Platform)|-|・`flutter_local_notifications`連携<br>・通知スケジューリング<br>・アプリ非起動時の動作|バックグラウンド|
|F011|バッジ獲得|App, Domain, Data|Badge, UserProgress(仮)|・獲得条件判定ロジック<br>・バッジ獲得状態の保存(Hive)|バックグラウンド/App|
|F012|獲得バッジ一覧|UI, App, Domain, Data|Badge|・獲得済みバッジの読み込み(Hive)<br>・グリッド等での表示|S004|
|F013|ローカル保存|-|Task, Category, Badge|-|Hiveの初期化、Box管理|-|

## 画面設計

### 画面一覧

|画面ID(仮)|画面名|主な機能|優先度|
|---|---|---|---|
|S001|タスク一覧画面 (ホーム)|タスク表示、完了操作、タスク追加/編集/削除への導線|高|
|S002|タスク登録/編集画面|タスク情報の入力、保存|高|
|S003|カテゴリ管理画面|カテゴリ一覧表示、作成、編集、削除|高|
|S004|獲得バッジ一覧画面|獲得したバッジの表示|高|
|S005|設定画面|通知時刻デフォルト設定など(検討)|中|

### 画面遷移図 (簡易)

```mermaid
graph TD
    S001[タスク一覧] --> S002[タスク登録/編集]
    S001 --> S003[カテゴリ管理]
    S001 --> S004[獲得バッジ一覧]
    S001 --> S005[設定(仮)]
    S002 --> S001
    S003 --> S001
    S004 --> S001
    S005 --> S001
```

### 主要画面レイアウト

各画面のモックアップまたは主要コンポーネントの説明:

#### 画面1: タスク一覧画面 (S001)

**主な構成要素**:
- AppBar (日付表示、設定等への導線)
- タスクリスト (日付ごと or 週ごとのタスク表示、チェックボックス)
- FAB (Floating Action Button) (タスク追加画面への遷移)
- (オプション) カテゴリフィルター、バッジ獲得通知

**ユーザーフロー**:
1. アプリ起動時に当日のタスクが表示される。
2. スワイプやボタンで表示期間を変更できる (検討)。
3. タスク横のチェックボックスで完了/未完了を切り替える。
4. FABをタップするとタスク登録画面(S002)へ遷移する。

#### 画面2: タスク登録/編集画面 (S002)

**主な構成要素**:
- AppBar (保存ボタン)
- タスクタイトル入力フィールド
- 繰り返し種別選択 (日次/週次)
- カテゴリ選択 (ドロップダウン or 別画面遷移)
- リマインダー時刻設定
- (編集時) 削除ボタン

**ユーザーフロー**:
1. S001から遷移後、各項目を入力/選択する。
2. AppBarの保存ボタンでタスクを保存し、S001に戻る。
3. (編集時) 削除ボタンタップで確認ダイアログ表示後、削除してS001に戻る。

#### 画面3: カテゴリ管理画面 (S003)

**主な構成要素**:
- AppBar (戻るボタン)
- カテゴリ一覧リスト (カテゴリ名、編集ボタン、削除ボタン)
- 新規カテゴリ追加ボタン (FABなど)

**ユーザーフロー**:
1. S001などから遷移。
2. 登録済みカテゴリがリスト表示される。
3. 新規追加ボタンタップ → カテゴリ名入力 → 保存 → リスト更新。
4. 編集ボタンタップ → カテゴリ名編集 → 保存 → リスト更新。
5. 削除ボタンタップ → 確認ダイアログ → 削除 → リスト更新。

#### 画面4: 獲得バッジ一覧画面 (S004)

**主な構成要素**:
- AppBar (戻るボタン)
- 獲得済みバッジ一覧 (グリッド or リスト形式、アイコン、名前、説明)

**ユーザーフロー**:
1. S001などから遷移。
2. 獲得済みバッジが一覧表示される。
3. (オプション) バッジタップで詳細表示。

#### 画面5: 設定画面 (S005) (仮)

**主な構成要素**:
- AppBar (戻るボタン)
- 通知設定 (ON/OFF, デフォルト時刻)
- (オプション) データリセット
- (オプション) バージョン情報

**ユーザーフロー**:
1. S001などから遷移。
2. 各設定項目を表示・変更する。

## データモデル設計

### エンティティ設計 (Hive Box定義に近い形)

#### エンティティ1: Task

```dart
@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late String id; // UUID

  @HiveField(1)
  late String title;

  @HiveField(2)
  late bool isDaily; // true: 日次, false: 週次

  @HiveField(3)
  String? categoryId; // Categoryのid

  @HiveField(4)
  DateTime? reminderTime; // 時刻のみ relevant

  // 完了記録: キー=日付(YYYYMMDD), 値=完了時刻(DateTime)
  @HiveField(5)
  late Map<String, DateTime> completionLog;

  @HiveField(6)
  late DateTime createdAt;

  @HiveField(7)
  late DateTime updatedAt;
}
```

#### エンティティ2: Category

```dart
@HiveType(typeId: 1)
class Category extends HiveObject {
  @HiveField(0)
  late String id; // UUID

  @HiveField(1)
  late String name;

  // (オプション) 色やアイコンなど
  // @HiveField(2)
  // String? colorCode;

  @HiveField(2) // Index変更
  late DateTime createdAt;

  @HiveField(3)
  late DateTime updatedAt;
}
```

#### エンティティ3: Badge

```dart
@HiveType(typeId: 2)
class Badge extends HiveObject {
  @HiveField(0)
  late String id; // 固定ID (例: 'daily_streak_5')

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late String iconAssetPath; // アイコン画像パス

  // 獲得したかどうかと日時を管理する別のBoxを用意する方が良いか検討
  // @HiveField(4)
  // DateTime? achievedAt;
}
```

#### (検討) ユーザー進捗/設定
- アチーブメント獲得状況 (Badge ID と獲得日時)
- アプリ設定 (通知ON/OFF、デフォルト通知時刻など)
- これらを別々のHive Boxで管理することを検討。

### エンティティ関連図 (簡易)

```mermaid
erDiagram
    TASK ||--o{ CATEGORY : "belongs to (optional)"
    TASK {
        String id PK
        String title
        bool isDaily
        String categoryId FK
        DateTime reminderTime
        Map_String,DateTime_ completionLog
        DateTime createdAt
        DateTime updatedAt
    }
    CATEGORY {
        String id PK
        String name
        DateTime createdAt
        DateTime updatedAt
    }
    BADGE {
        String id PK
        String name
        String description
        String iconAssetPath
    }
    USER_PROGRESS {
        String badgeId FK
        DateTime achievedAt
    }
    BADGE ||--o{ USER_PROGRESS : "achieved by user"
```
*注: USER_PROGRESS は獲得したバッジ情報を管理する概念的なエンティティ。HiveではBadge IDのリストやMapで管理する可能性が高い。*

## API設計

### 外部API連携 (該当する場合)

- MVPでは外部API連携なし。

### 内部API設計 (バックエンドがある場合)

- MVPではバックエンドなし。

## セキュリティ設計

### 認証・認可方式

- MVPでは認証・認可機能なし。データはローカルにのみ保存。

### データ保護

- ローカルデータ (Hive Box) はOSレベルの保護に依存。機密性の高い情報（個人情報、パスワード等）はMVPスコープでは扱わない。
- 将来的に同期機能を実装する場合は、HTTPS通信、適切な認証、サーバーサイドでのデータ暗号化が必須。

## 性能最適化計画

- **UI**: Flutterの最適化手法（const widget, RepaintBoundary等）を活用し、スムーズな描画を目指す。
- **データアクセス**: HiveのクエリやBox操作を効率的に行い、リスト表示等のパフォーマンスを確保する。大量データ時の影響を考慮する。
- **画像最適化**: アチーブメントバッジ等の画像リソースは適切なサイズ・形式を使用する。
- **オフライン対応**: ローカルDB前提のため、基本的にオフラインで動作。
- **メモリ使用量最適化**: Riverpod Providerの適切なスコープ管理、不要なオブジェクトの破棄。

## 技術的意思決定

|決定事項|選択したオプション|代替案|選択理由|
|---|---|---|---|
|状態管理|Riverpod|Provider, GetX, Bloc|学習コスト、依存性注入、テスト容易性のバランス|
|ローカルDB|Hive|SQLite (sqflite), SharedPreferences|オブジェクト指向DB、パフォーマンス、セットアップの容易さ|
|ローカル通知|flutter_local_notifications|firebase_messaging (FCM)|FCMはサーバー連携前提のため、ローカル完結のMVPには不向き|
|ID生成|uuid|タイムスタンプベースID|グローバルな一意性が保証されるため|

## サードパーティライブラリ

|ライブラリ名|バージョン|用途|選定理由|
|---|---|---|---|
|flutter_riverpod|^[latest]|状態管理、依存性注入|主要な状態管理手法として採用|
|hive|^[latest]|ローカルデータ永続化|主要なローカルDBとして採用|
|hive_flutter|^[latest]|HiveとFlutterの連携|Hive利用に必須|
|flutter_local_notifications|^[latest]|ローカル通知の実装|主要機能のため|
|path_provider|^[latest]|ファイルシステムパス取得|Hiveの初期化に必要|
|uuid|^[latest]|一意なID生成|エンティティID生成のため|
|intl|^[latest]|日付・時刻フォーマット|表示やログ記録のため|

## 既知の制限事項

- **データ永続性**: アプリのアンインストールでデータは消失する (ローカル保存のみ)。
- **マルチデバイス非対応**: データ同期機能がないため、複数デバイスでの利用は想定しない。
- **バックグラウンド処理**: ローカル通知以外の厳密なバックグラウンド処理は実装しない。
- **Hiveマイグレーション**: データモデル変更時のマイグレーションは考慮が必要だが、MVPではシンプルな構造に留める。

## 将来の拡張性計画

- **認証・同期**: Phase 2以降でFirebase AuthenticationやCloud Firestore/Supabase等を利用した認証・データ同期機能の追加を検討。
- **カレンダー表示**: タスクをカレンダー形式で表示する機能。
- **統計・レポート**: タスク完了率などの統計情報を表示する機能。
- **共有機能**: タスクや進捗を他ユーザーと共有する機能。