これは Flutter プロジェクトです。
`Domain-Driven Design`で開発をおこうため、lib ディレクトリの構成は下記の例に従います。

```
```
lib/
├── main.dart
├── src/
│   ├── app.dart
│   ├── core/
│   │   ├── constant/
│   │   │   └── app_constant.dart
│   │   ├── exception/
│   │   │   └── app_exception.dart
│   │   ├── localization/
│   │   │   └── app_localizations.dart
│   │   ├── router/
│   │   │   └── app_router.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   └── util/
│   │       ├── logger.dart
│   │       └── result.dart
│   ├── shared/
│   │   ├── state/
│   │   │   └── shared_state.dart
│   │   └── widget/
│   │       ├── loading_indicator.dart
│   │       └── error_view.dart
│   ├── ui/
│   │   ├── auth/
│   │   │   ├── page/
│   │   │   │   ├── login_page.dart
│   │   │   │   └── register_page.dart
│   │   │   ├── state/
│   │   │   │   ├── auth_state.dart
│   │   │   │   └── auth_state.g.dart
│   │   │   └── widget/
│   │   │       ├── login_form.dart
│   │   │       └── auth_button.dart
│   │   └── todo/
│   │       ├── page/
│   │       │   ├── todo_list_page.dart
│   │       │   ├── todo_detail_page.dart
│   │       │   └── todo_create_page.dart
│   │       ├── state/
│   │       │   ├── todo_state.dart
│   │       │   └── todo_state.g.dart
│   │       └── widget/
│   │           ├── todo_list_item.dart
│   │           └── todo_form.dart
│   └── feature/
│       ├── auth/
│       │   ├── domain/
│       │   │   ├── entity/
│       │   │   │   └── user.dart
│       │   │   ├── repository/
│       │   │   │   └── auth_repository.dart  # interface
│       │   │   ├── value_object/
│       │   │   │   ├── email.dart
│       │   │   │   └── password.dart
│       │   │   └── domain_service/
│       │   │       ├── password_hasher.dart
│       │   │       └── token_validator.dart
│       │   ├── application/
│       │   │   ├── login_service.dart
│       │   │   └── register_service.dart
│       │   └── data/
│       │       ├── repository/
│       │       │   └── auth_repository_impl.dart
│       │       ├── dto/
│       │       │   └── user_dto.dart
│       │       └── datasource/
│       │           ├── user_datasource.dart # interface
│       │           ├── local_user_database.dart
│       │           └── remote_user_api.dart
│       └── todo/
│           ├── domain/
│           │   ├── entity/
│           │   │   └── todo.dart
│           │   ├── repository/
│           │   │   └── todo_repository.dart # interface
│           │   └── value_object/
│           │       ├── todo_id.dart
│           │       └── todo_status.dart
│           ├── application/
│           │   └── todo_service.dart
│           └── data/
│               ├── repository/
│               │   └── todo_repository_impl.dart
│               ├── dto/
│               │   └── todo_dto.dart
│               └── datasource/
│                   ├── todo_datasource.dart # interface
│                   ├── local_todo_database.dart
│                   └── remote_todo_api.dart
test/
├── src/ (same as lib)
│   ├── ui/
│   │   └── auth/
│   │       └── page/
│   │           ├── login_page.dart
│   │           └── register_page.dart
│   └── feature/
│       └── auth/
│           └── domain/
integration_test/
└── app_flow_test.dart
docs/
└── <documents>
```
```


