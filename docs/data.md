# Data
## CatalogItem

買い物リストへ追加するために事前登録されたアイテム

```
/shopping_lists/:id/catalog_items/:id
```

| Field       | Type     | Description  |
| ----------- | -------- | ------------ |
| `name`      | `string` | アイテム名   |
| `imageUrl`  | `string` | アイテム画像 |
| `memo` (Op) | `string` | メモ         |

## ShoppingItem

- 各買い物リストに含まれる買い物アイテム。
- DocumentIdは、`CatalogItem`のDocumentIdと一致する。
- ユーザーは`CatalogItem`を選択し`ShoppingList`に追加することで、`ShoppingItem`として保存される。
- `CatalogItem`を継承しているため、`CatalogItem`のすべてのパラメータを持つ

```
/shopping_lists/:id/shopping_items/:id
```

| Field                              | Type                 | Description             |
| ---------------------------------- | -------------------- | ----------------------- |
| `status`                           | `ShoppingItemStatus` | アイテムの状態          |
| ...その他`CatalogItem`のパラメータ | -                    | `CatalogItem`継承のため |

### ShoppingItemStatus

| Value       | Description  |
| ----------- | ------------ |
| `pending`   | 未購入状態   |
| `purchased` | 購入済の状態 |

## UserProfile

- 各ユーザーのプロファイル情報を保持するモデル。

```
/user_profiles/:id
```

| Field  | Type     | Description |
| ------ | -------- | ----------- |
| `name` | `string` | ユーザー名  |



## UserShoppingList

- ユーザーごとの設定を含む買い物リスト

```
/user_profiles/:id/user_shopping_lists/:id
```

| Field          | Type           | Description          |
| -------------- | -------------- | -------------------- |
| `shoppingList` | `ShoppingList` | 買い物リスト情報     |
| `orderIndex`   | `int`          | ソート用インデックス |



## UserShoppingItem

- ユーザーごとの設定を含む買い物アイテム
- `ShoppingItem`を継承しているため、`ShoppingItem`のすべてのパラメータを持つ

```
/user_profiles/:id/user_shopping_lists/:id/user_shopping_items/:id
```

| Field                               | Type  | Description              |
| ----------------------------------- | ----- | ------------------------ |
| `orderIndex`                        | `int` | ソート用インデックス     |
| ...その他`ShoppingItem`のパラメータ | -     | `ShoppingItem`継承のため |
