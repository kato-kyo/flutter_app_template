# Flutter DDD開発 `domain`ディレクトリ構成

`domain` ディレクトリはDomain-Driven Design (DDD)アーキテクチャの中核となる層で、ビジネスロジックとルールを表現する場所です。
この層はUIやデータアクセスなどの外部の関心事から完全に独立しており、アプリケーションのコアとなるビジネスルールを定義します。

`lib/src/feature/{機能名}/domain/`に配置します。

## 構造

例:
```
feature/
|- todo/  # feature_name
|  |- domain/
|  |  |- entity/
|  |  |  |- todo.dart
|  |  |- repository/
|  |  |  |- todo_repository.dart
|  |  |- value_object/
|  |  |  |- todo_id.dart
|  |  |  |- todo_status.dart
```
## Domain層の主要コンポーネント

### Entity（エンティティ）

```
lib/src/feature/todo/domain/entity/todo.dart
```

- ビジネスドメインの中核となるオブジェクト
- 一意のIDを持ち、ライフサイクルを通じて同一性が維持される
- 自身の状態を変更するメソッドを持つことができる
- 例: Todo, User などのビジネスオブジェクト

### Value Object（値オブジェクト）

```
lib/src/feature/todo/domain/value_object/todo_id.dart
lib/src/feature/todo/domain/value_object/todo_status.dart
```

- 属性のみで定義され、IDを持たないオブジェクト
- 不変（イミュータブル）であるべき
- 等価性は属性値に基づく
- バリデーションロジックを含む
- 例: TodoId, TodoStatus, Email, Password など

### Repository（リポジトリ）

```
lib/src/feature/todo/domain/repository/todo_repository.dart
```

- エンティティの永続化と取得のための抽象インターフェース
- 実装の詳細（DBやAPIなど）を隠蔽
- Domain層には**インターフェースのみ**が定義される
- 実装は`data`層に置かれる

### Domain Service（ドメインサービス）

```
lib/src/feature/auth/domain/domain_service/password_hasher.dart
lib/src/feature/auth/domain/domain_service/token_validator.dart
```

- 単一のエンティティに属さないビジネスロジック
- 複数のエンティティ間の関係や操作を扱う
- ステートレスであるべき
- 例: パスワードハッシュ化、トークン検証など

## Domain層の特徴と責務

1. **ビジネスルールの集中管理**：
   - アプリケーションのコアビジネスロジックを一箇所に集約
   - ビジネスルールの変更が他の層に影響しにくい設計

2. **外部依存からの独立**：
   - UIやデータベースなどの外部技術から独立している
   - フレームワークやライブラリに依存しない（Flutterにも依存しない）

3. **ドメインモデルの表現**：
   - ビジネスドメインを正確に表現するモデルの定義
   - ユビキタス言語（共通言語）の実装

4. **バリデーションロジック**：
   - エンティティや値オブジェクトの整合性を保証するバリデーション
   - ドメインのルールに基づく入力検証

## ユースケース例

例えば、TodoアプリケーションのDomain層は以下のような要素を含みます：

- **Todo Entity**: タスクのタイトル、説明、期限、状態などの属性とそれらを操作するメソッド
- **TodoId Value Object**: タスクの一意のID（フォーマット検証を含む）
- **TodoStatus Value Object**: タスクの状態（未完了、完了など）の列挙型と検証
- **TodoRepository Interface**: タスクの保存、取得、更新、削除のための抽象インターフェース

## Domain層とApplication層の関係

Domain層で定義されたモデルやルールは、Application層のサービスによって利用されます：

```
lib/src/feature/todo/application/todo_service.dart
```

Application層は、ユースケースを実装し、UIレイヤーとDomain層の間の調整役として機能します。
