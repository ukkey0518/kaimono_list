# CatalogItem

事前登録された買い物アイテム（カタログデータ）

## Reference

```
/shopping_lists/:id/catalog_items/:id
```

## Params

| Field           | Type     | Description               |
| --------------- | -------- | ------------------------- |
| `name`          | `string` | アイテムの名前            |
| `imageUrl` (Op) | `string` | アイテムの画像URL（任意） |

## Rule

要検討
```javascript
match /shopping_lists/{shoppingListId} {
    match /catalog_items/{itemId} {
        // アイテムの読み取り・書き込み: 認証されているユーザーは誰でも
        allow read, write: if request.auth != null;
    }
}
```

## Triggers

| Trigger  | Description                                                                          |
| -------- | ------------------------------------------------------------------------------------ |
| onCreate | なし。これはカタログとしてのマスタデータであるため、関連する処理は作成後に発生する。 |
| onUpdate | 同じIDを持つ全ての `ShoppingItem` にその変更内容を反映する。                         |
| onDelete | 同じIDを持つ全ての `ShoppingItem` を削除する。                                       |

