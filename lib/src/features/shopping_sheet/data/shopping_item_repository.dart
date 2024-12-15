import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_sheet_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';
import 'package:kaimono_list/src/utils/extensions/firestore_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_item_repository.g.dart';

class ShoppingItemRepository {
  const ShoppingItemRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String collectionPath(String shoppingSheetId) {
    return '${ShoppingSheetRepository.documentPath(shoppingSheetId)}'
        '/shopping_items';
  }

  static String documentPath(String shoppingSheetId, String shoppingItemId) {
    return '${collectionPath(shoppingSheetId)}/$shoppingItemId';
  }

  CollectionReference<ShoppingItem> collectionRef(
    String shoppingSheetId,
  ) {
    return _firestore.collection(collectionPath(shoppingSheetId)).withConverter(
          fromFirestore: (ds, _) => ShoppingItem.fromJson(ds.toModelJson()!),
          toFirestore: (shoppingItem, _) => shoppingItem.toJson(),
        );
  }

  DocumentReference<ShoppingItem> documentRef(
    String shoppingSheetId,
    String shoppingItemId,
  ) {
    return _firestore
        .doc(documentPath(shoppingSheetId, shoppingItemId))
        .withConverter(
          fromFirestore: (ds, _) => ShoppingItem.fromJson(ds.toModelJson()!),
          toFirestore: (shoppingItem, _) => shoppingItem.toJson(),
        );
  }

  Stream<List<ShoppingItem>> watchList({
    required String shoppingSheetId,
  }) {
    final query =
        collectionRef(shoppingSheetId).orderBy('index', descending: true);
    return query.snapshots().map(
          (qs) => qs.docs.map((ds) => ds.data()).toList(),
        );
  }

  Future<List<ShoppingItem>> fetchList({
    required String shoppingSheetId,
  }) async {
    final query =
        collectionRef(shoppingSheetId).orderBy('index', descending: true);
    final qs = await query.get();
    return qs.docs.map((ds) => ds.data()).toList();
  }

  Stream<bool> watchIsAnyCompletedShoppingItemExists({
    required String shoppingSheetId,
  }) {
    final query = collectionRef(shoppingSheetId)
        .where('isCompleted', isEqualTo: true)
        .limit(1);
    return query.snapshots().map((qs) => qs.docs.isNotEmpty);
  }

  Future<String> create({
    required String shoppingSheetId,
    required ShoppingItem shoppingItem,
  }) async {
    final maxOrderIndex = await _fetchMaxOrderIndex(
      shoppingSheetId: shoppingSheetId,
    );
    shoppingItem = shoppingItem.copyWith(
      index: maxOrderIndex == null ? 0 : maxOrderIndex + 1,
    );

    final ref = await collectionRef(shoppingSheetId).add(shoppingItem);
    return ref.id;
  }

  Future<int?> _fetchMaxOrderIndex({
    required String shoppingSheetId,
  }) async {
    final qs = await collectionRef(shoppingSheetId)
        .orderBy('index', descending: true)
        .limit(1)
        .get();
    return qs.docs.firstOrNull?.data().index;
  }

  Future<void> updateName({
    required String shoppingSheetId,
    required String shoppingItemId,
    required String name,
  }) async {
    await documentRef(shoppingSheetId, shoppingItemId).update({
      'name': name,
    });
  }

  Future<void> updateIsCompleted({
    required String shoppingSheetId,
    required String shoppingItemId,
    required bool isCompleted,
  }) async {
    await documentRef(shoppingSheetId, shoppingItemId).update({
      'isCompleted': isCompleted,
    });
  }

  Future<void> updateIndexes({
    required String shoppingSheetId,
    required List<String> sortedShoppingItemIds,
  }) async {
    final batch = _firestore.batch();
    for (final (index, shoppingItemId)
        in sortedShoppingItemIds.reversed.indexed) {
      batch.update(
        documentRef(shoppingSheetId, shoppingItemId),
        {'index': index},
      );
    }
    await batch.commit();
  }

  Future<void> delete({
    required String shoppingSheetId,
    required String shoppingItemId,
  }) async {
    await documentRef(shoppingSheetId, shoppingItemId).delete();
  }

  Future<void> deleteListCompleted({
    required String shoppingSheetId,
  }) async {
    final batch = _firestore.batch();
    final qs = await collectionRef(shoppingSheetId)
        .where('isCompleted', isEqualTo: true)
        .get();
    for (final ds in qs.docs) {
      batch.delete(ds.reference);
    }
    await batch.commit();
  }

  Future<void> deleteAll({
    required String shoppingSheetId,
  }) async {
    final batch = _firestore.batch();
    final qs = await collectionRef(shoppingSheetId).get();
    for (final ds in qs.docs) {
      batch.delete(ds.reference);
    }
    await batch.commit();
  }
}

@Riverpod(dependencies: [])
ShoppingItemRepository shoppingItemRepository(Ref ref) {
  return ShoppingItemRepository(FirebaseFirestore.instance);
}

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
Stream<List<ShoppingItem>> shoppingItemsStream(
  Ref ref,
  String shoppingSheetId,
) {
  final repository = ref.watch(shoppingItemRepositoryProvider);
  return repository.watchList(shoppingSheetId: shoppingSheetId);
}

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
Future<List<ShoppingItem>> shoppingItemsFuture(
  Ref ref,
  String shoppingSheetId,
) {
  final repository = ref.watch(shoppingItemRepositoryProvider);
  return repository.fetchList(shoppingSheetId: shoppingSheetId);
}

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
Stream<bool> isAnyCompletedShoppingItemExistsStream(
  Ref ref,
  String shoppingSheetId,
) {
  final repository = ref.watch(shoppingItemRepositoryProvider);
  return repository.watchIsAnyCompletedShoppingItemExists(
    shoppingSheetId: shoppingSheetId,
  );
}
