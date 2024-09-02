# ShoppingItem

買い物リストに追加されたアイテム（カタログアイテムを基に作成）

## Reference

```
/shopping_lists/:id/shopping_items/:id
```

## Params

| Field           | Type     | Description                             |
| --------------- | -------- | --------------------------------------- |
| `name`          | `string` | アイテムの名前（カタログからコピー）    |
| `imageUrl` (Op) | `string` | アイテムの画像URL（カタログからコピー） |
| `status`        | `string` | アイテムのステータス                    |


## Rule

要検討
```javascript
match /shopping_lists/{shoppingListId}/shopping_items/{itemId} {
    // 認証されたユーザーは読み取り可能
    allow read: if request.auth != null;

    // アイテムの作成・更新・削除は作成者のみ可能
    allow create, update, delete: if resource.data.createdBy == request.auth.uid;
}
```

## Triggers

| Trigger  | Description                                                  |
| -------- | ------------------------------------------------------------ |
| onCreate |                                                              |
| onUpdate | 同じIDを持つ全ての `ShoppingItem` にその変更内容を反映する。 |
| onDelete | 同じIDを持つ全ての `ShoppingItem` を削除する。               |