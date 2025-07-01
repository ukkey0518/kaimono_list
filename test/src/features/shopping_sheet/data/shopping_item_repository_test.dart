import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('ShoppingItemRepository', () {
    late FakeFirebaseFirestore fakeFirestore;
    late ShoppingItemRepository repository;
    late String testShoppingSheetId;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      repository = ShoppingItemRepository(fakeFirestore);
      testShoppingSheetId = 'test-shopping-sheet-id';
    });

    group('collectionPath', () {
      test('正しいコレクションパスを返す', () {
        final path = ShoppingItemRepository.collectionPath(testShoppingSheetId);
        expect(path, 'shopping_sheets/$testShoppingSheetId/shopping_items');
      });
    });

    group('documentPath', () {
      test('正しいドキュメントパスを返す', () {
        const shoppingItemId = 'test-item-id';
        final path = ShoppingItemRepository.documentPath(
          testShoppingSheetId,
          shoppingItemId,
        );
        expect(
          path,
          'shopping_sheets/$testShoppingSheetId/shopping_items/$shoppingItemId',
        );
      });
    });

    group('watchList', () {
      test('指定されたshopping_sheet_idのアイテムリストを監視できる', () async {
        // テストデータを準備
        final testItems = [
          const ShoppingItem(name: 'Item 1', index: 0),
          const ShoppingItem(name: 'Item 2', index: 1),
          const ShoppingItem(name: 'Item 3', index: 2),
        ];

        // テストデータをFirestoreに追加
        final collectionRef = fakeFirestore.collection(
          'shopping_sheets/$testShoppingSheetId/shopping_items',
        );
        for (final item in testItems) {
          await collectionRef.add(item.toJson());
        }

        // ストリームを監視
        final stream = repository.watchList(
          shoppingSheetId: testShoppingSheetId,
        );
        final items = await stream.first;

        // 結果を検証（indexの降順でソートされる）
        expect(items.length, 3);
        expect(items[0].name, 'Item 3');
        expect(items[1].name, 'Item 2');
        expect(items[2].name, 'Item 1');
      });

      test('アイテムが存在しない場合は空のリストを返す', () async {
        final stream = repository.watchList(
          shoppingSheetId: testShoppingSheetId,
        );
        final items = await stream.first;
        expect(items, isEmpty);
      });
    });

    group('fetchList', () {
      test('指定されたshopping_sheet_idのアイテムリストを取得できる', () async {
        // テストデータを準備
        final testItems = [
          const ShoppingItem(name: 'Item 1', index: 0),
          const ShoppingItem(name: 'Item 2', index: 1),
        ];

        // テストデータをFirestoreに追加
        final collectionRef = fakeFirestore.collection(
          'shopping_sheets/$testShoppingSheetId/shopping_items',
        );
        for (final item in testItems) {
          await collectionRef.add(item.toJson());
        }

        // リストを取得
        final items = await repository.fetchList(
          shoppingSheetId: testShoppingSheetId,
        );

        // 結果を検証（indexの降順でソートされる）
        expect(items.length, 2);
        expect(items[0].name, 'Item 2');
        expect(items[1].name, 'Item 1');
      });
    });

    group('watchIsAnyCompletedShoppingItemExists', () {
      test('完了済みアイテムが存在する場合はtrueを返す', () async {
        // テストデータを準備（完了済みアイテムを含む）
        final testItems = [
          const ShoppingItem(name: 'Item 1', index: 0),
          const ShoppingItem(name: 'Item 2', isCompleted: true, index: 1),
        ];

        // テストデータをFirestoreに追加
        final collectionRef = fakeFirestore.collection(
          'shopping_sheets/$testShoppingSheetId/shopping_items',
        );
        for (final item in testItems) {
          await collectionRef.add(item.toJson());
        }

        // ストリームを監視
        final stream = repository.watchIsAnyCompletedShoppingItemExists(
          shoppingSheetId: testShoppingSheetId,
        );
        final exists = await stream.first;

        expect(exists, isTrue);
      });

      test('完了済みアイテムが存在しない場合はfalseを返す', () async {
        // テストデータを準備（未完了アイテムのみ）
        final testItems = [
          const ShoppingItem(name: 'Item 1', index: 0),
          const ShoppingItem(name: 'Item 2', index: 1),
        ];

        // テストデータをFirestoreに追加
        final collectionRef = fakeFirestore.collection(
          'shopping_sheets/$testShoppingSheetId/shopping_items',
        );
        for (final item in testItems) {
          await collectionRef.add(item.toJson());
        }

        // ストリームを監視
        final stream = repository.watchIsAnyCompletedShoppingItemExists(
          shoppingSheetId: testShoppingSheetId,
        );
        final exists = await stream.first;

        expect(exists, isFalse);
      });
    });

    group('create', () {
      test('新しいアイテムを作成できる', () async {
        const newItem = ShoppingItem(name: 'New Item');

        final itemId = await repository.create(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: newItem,
        );

        expect(itemId, isNotEmpty);

        // 作成されたアイテムを確認
        final createdItem = await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(itemId)
            .get();

        expect(createdItem.exists, isTrue);
        expect(createdItem.data()?['name'], 'New Item');
        expect(createdItem.data()?['index'], 0); // 最初のアイテムなのでindexは0
      });

      test('複数のアイテムを作成した場合、indexが順番に割り当てられる', () async {
        // 最初のアイテムを作成
        const item1 = ShoppingItem(name: 'Item 1');
        final item1Id = await repository.create(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: item1,
        );

        // 2番目のアイテムを作成
        const item2 = ShoppingItem(name: 'Item 2');
        final item2Id = await repository.create(
          shoppingSheetId: testShoppingSheetId,
          shoppingItem: item2,
        );

        // indexを確認
        final doc1 = await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(item1Id)
            .get();
        final doc2 = await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(item2Id)
            .get();

        expect(doc1.data()?['index'], 0);
        expect(doc2.data()?['index'], 1);
      });
    });

    group('updateName', () {
      test('アイテムの名前を更新できる', () async {
        // テストアイテムを作成
        const itemId = 'test-item-id';
        const testItem = ShoppingItem(name: 'Original Name');
        await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(itemId)
            .set(testItem.toJson());

        // 名前を更新
        await repository.updateName(
          shoppingSheetId: testShoppingSheetId,
          shoppingItemId: itemId,
          name: 'Updated Name',
        );

        // 更新を確認
        final updatedDoc = await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(itemId)
            .get();

        expect(updatedDoc.data()?['name'], 'Updated Name');
      });
    });

    group('updateIsCompleted', () {
      test('アイテムの完了状態を更新できる', () async {
        // テストアイテムを作成
        const itemId = 'test-item-id';
        const testItem = ShoppingItem(name: 'Test Item');
        await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(itemId)
            .set(testItem.toJson());

        // 完了状態を更新
        await repository.updateIsCompleted(
          shoppingSheetId: testShoppingSheetId,
          shoppingItemId: itemId,
          isCompleted: true,
        );

        // 更新を確認
        final updatedDoc = await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(itemId)
            .get();

        expect(updatedDoc.data()?['isCompleted'], isTrue);
      });
    });

    group('updateIndexes', () {
      test('複数のアイテムのindexを一括更新できる', () async {
        // テストアイテムを作成
        const item1Id = 'item-1';
        const item2Id = 'item-2';
        const item3Id = 'item-3';

        final testItems = [
          const ShoppingItem(name: 'Item 1', index: 0),
          const ShoppingItem(name: 'Item 2', index: 1),
          const ShoppingItem(name: 'Item 3', index: 2),
        ];

        final collectionRef = fakeFirestore.collection(
          'shopping_sheets/$testShoppingSheetId/shopping_items',
        );
        await collectionRef.doc(item1Id).set(testItems[0].toJson());
        await collectionRef.doc(item2Id).set(testItems[1].toJson());
        await collectionRef.doc(item3Id).set(testItems[2].toJson());

        // indexを更新（逆順に並び替え）
        await repository.updateIndexes(
          shoppingSheetId: testShoppingSheetId,
          sortedShoppingItemIds: [item3Id, item2Id, item1Id],
        );

        // 更新を確認
        final doc1 = await collectionRef.doc(item1Id).get();
        final doc2 = await collectionRef.doc(item2Id).get();
        final doc3 = await collectionRef.doc(item3Id).get();

        expect(doc1.data()?['index'], 0);
        expect(doc2.data()?['index'], 1);
        expect(doc3.data()?['index'], 2);
      });
    });

    group('delete', () {
      test('指定されたアイテムを削除できる', () async {
        // テストアイテムを作成
        const itemId = 'test-item-id';
        const testItem = ShoppingItem(name: 'Test Item');
        await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(itemId)
            .set(testItem.toJson());

        // アイテムを削除
        await repository.delete(
          shoppingSheetId: testShoppingSheetId,
          shoppingItemId: itemId,
        );

        // 削除を確認
        final deletedDoc = await fakeFirestore
            .collection('shopping_sheets/$testShoppingSheetId/shopping_items')
            .doc(itemId)
            .get();

        expect(deletedDoc.exists, isFalse);
      });
    });

    group('deleteListCompleted', () {
      test('完了済みのアイテムを一括削除できる', () async {
        // テストアイテムを作成（完了済みと未完了を混在）
        final testItems = [
          const ShoppingItem(name: 'Item 1', index: 0),
          const ShoppingItem(name: 'Item 2', isCompleted: true, index: 1),
          const ShoppingItem(name: 'Item 3', index: 2),
          const ShoppingItem(name: 'Item 4', isCompleted: true, index: 3),
        ];

        final collectionRef = fakeFirestore.collection(
          'shopping_sheets/$testShoppingSheetId/shopping_items',
        );
        for (final item in testItems) {
          await collectionRef.add(item.toJson());
        }

        // 完了済みアイテムを削除
        await repository.deleteListCompleted(
          shoppingSheetId: testShoppingSheetId,
        );

        // 削除結果を確認
        final remainingDocs = await collectionRef.get();
        expect(remainingDocs.docs.length, 2);

        // 残っているアイテムは未完了のみ
        for (final doc in remainingDocs.docs) {
          expect(doc.data()['isCompleted'], isFalse);
        }
      });
    });

    group('deleteAll', () {
      test('指定されたshopping_sheetの全アイテムを削除できる', () async {
        // テストアイテムを作成
        final testItems = [
          const ShoppingItem(name: 'Item 1', index: 0),
          const ShoppingItem(name: 'Item 2', index: 1),
          const ShoppingItem(name: 'Item 3', index: 2),
        ];

        final collectionRef = fakeFirestore.collection(
          'shopping_sheets/$testShoppingSheetId/shopping_items',
        );
        for (final item in testItems) {
          await collectionRef.add(item.toJson());
        }

        // 全アイテムを削除
        await repository.deleteAll(shoppingSheetId: testShoppingSheetId);

        // 削除結果を確認
        final remainingDocs = await collectionRef.get();
        expect(remainingDocs.docs, isEmpty);
      });
    });
  });
}

class MockShoppingItemRepository extends Mock
    implements ShoppingItemRepository {}
