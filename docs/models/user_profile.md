# UserShoppingList

ユーザーのプロフィール情報

## Reference

```
/user_profiles/:id/user_shopping_lists/:id
```

## Params


| Field        | Type  | Description |
| ------------ | ----- | ----------- |
| `orderIndex` | `int` | ユーザー名  |


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
