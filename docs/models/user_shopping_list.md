# UserShoppingList

ユーザーの買い物リスト情報

## Reference

```
/user_profiles/:id/user_shopping_lists/:id
```

## Params

| Field  | Type     | Description |
| ------ | -------- | ----------- |
| `name`           | `string`             | リストの名前       |
| `status`         | `ShoppingListStatus` | リストのステータス |
| `orderIndex` | `int` | リストの並び順を表すインデックス  |

- `name`, `status`は`ShoppingList`パラメータを同期しているため、読み取り専用として扱う。


## Rule

要検討
```javascript
match /users/{userId} {
  // 読み取り・書き込み: 本人のみ
  allow read, write: if request.auth != null && request.auth.uid == userId;
}
```


## Triggers

| Trigger  | Description |
| -------- | ----------- |
| onCreate | -           |
| onUpdate | -           |
| onDelete | -           |