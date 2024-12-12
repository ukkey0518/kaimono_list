import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/exceptions/model_validation_exception.dart';
import 'package:kaimono_list/src/exceptions/permission_denied_exception.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/utils/extensions/firestore_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_item_repository.g.dart';

class ShoppingItemRepository {
  const ShoppingItemRepository(this._firestore);

  final FirebaseFirestore _firestore;

  // ------------------------------------------------------------------------ //

  static String shoppingItemsPath(String shoppingListId) {
    final parentPath = ShoppingListRepository.shoppingListPath(shoppingListId);
    return '$parentPath/shopping_items';
  }

  static String shoppingItemPath(
    String shoppingListId,
    String shoppingItemId,
  ) {
    return '${shoppingItemsPath(shoppingListId)}/$shoppingItemId';
  }

  CollectionReference<ShoppingItem> shoppingItemsRef(String shoppingListId) {
    return _firestore
        .collection(shoppingItemsPath(shoppingListId))
        .withConverter(
          fromFirestore: (ds, _) => ShoppingItem.fromJson(ds.toModelData()!),
          toFirestore: (shoppingItem, _) => shoppingItem.toJson(),
        );
  }

  DocumentReference<ShoppingItem> shoppingItemRef(
    String shoppingListId,
    String shoppingItemId,
  ) {
    return _firestore
        .doc(shoppingItemPath(shoppingListId, shoppingItemId))
        .withConverter(
          fromFirestore: (ds, _) => ShoppingItem.fromJson(ds.toModelData()!),
          toFirestore: (shoppingItem, _) => shoppingItem.toJson(),
        );
  }

  // ------------------------------------------------------------------------ //

  Stream<List<ShoppingItem>> watchShoppingItems({
    required String shoppingListId,
  }) {
    final query = shoppingItemsRef(shoppingListId)
        .orderBy('orderIndex', descending: true);
    return query.snapshots().map(
          (qs) => qs.docs.map((ds) => ds.data()).toList(),
        );
  }

  Future<List<ShoppingItem>> listShoppingItems({
    required String shoppingListId,
  }) async {
    final query = shoppingItemsRef(shoppingListId)
        .orderBy('orderIndex', descending: true);
    final qs = await query.get();
    return qs.docs.map((ds) => ds.data()).toList();
  }

  Stream<bool> watchHasAnyPurchasedShoppingItem({
    required String shoppingListId,
  }) {
    return shoppingItemsRef(shoppingListId)
        .where('isPurchased', isEqualTo: true)
        .limit(1)
        .snapshots()
        .map((qs) => qs.docs.isNotEmpty);
  }

  Future<ShoppingItem?> fetchShoppingItem({
    required String shoppingListId,
    required String shoppingItemId,
  }) async {
    final ds = await shoppingItemRef(shoppingListId, shoppingItemId).get();
    return ds.data();
  }

  Future<String> createShoppingItem({
    required String shoppingListId,
    required ShoppingItem shoppingItem,
  }) async {
    final maxOrderIndex = await _fetchMaxOrderIndex(
      shoppingListId: shoppingListId,
    );
    shoppingItem = shoppingItem.copyWith(
      orderIndex: maxOrderIndex == null ? 0 : maxOrderIndex + 1,
    );
    final validationErrorMessage = shoppingItem.validateForCreate();
    if (validationErrorMessage != null) {
      throw ModelValidationException(validationErrorMessage, shoppingItem);
    }
    final ref = await shoppingItemsRef(shoppingListId).add(shoppingItem);
    return ref.id;
  }

  Future<void> updateShoppingItem({
    required String shoppingListId,
    required ShoppingItem shoppingItem,
  }) async {
    final validationErrorMessage = shoppingItem.validateForUpdate();
    if (validationErrorMessage != null) {
      throw ModelValidationException(validationErrorMessage, shoppingItem);
    }
    await shoppingItemRef(shoppingListId, shoppingItem.id!).set(
      shoppingItem,
      SetOptions(merge: true),
    );
  }

  Future<void> updateShoppingItemOrderIndexes({
    required String shoppingListId,
    required List<ShoppingItem> shoppingItems,
  }) async {
    final batch = _firestore.batch();
    for (final shoppingItem in shoppingItems) {
      final ref = shoppingItemRef(shoppingListId, shoppingItem.id!);
      final ds = await ref.get();
      if (!ds.exists) {
        continue;
      }
      final oldIndex = ds.data()!.orderIndex;
      final newIndex = shoppingItem.orderIndex;
      if (newIndex != null && oldIndex != newIndex) {
        batch.update(ref, {'orderIndex': newIndex});
      }
    }
    await batch.commit();
  }

  Future<void> deleteShoppingItem({
    required String shoppingListId,
    required String shoppingItemId,
  }) async {
    await shoppingItemRef(shoppingListId, shoppingItemId).delete();
  }

  Future<void> deleteAllPurchasedShoppingItems({
    required String shoppingListId,
  }) async {
    final qs = await shoppingItemsRef(shoppingListId)
        .where('isPurchased', isEqualTo: true)
        .get();
    final batch = _firestore.batch();
    for (final ds in qs.docs) {
      batch.delete(ds.reference);
    }
    await batch.commit();
  }

  Future<void> deleteAllShoppingItems({
    required String shoppingListId,
  }) async {
    final qs = await shoppingItemsRef(shoppingListId).get();
    final batch = _firestore.batch();
    for (final ds in qs.docs) {
      batch.delete(ds.reference);
    }
    await batch.commit();
  }

  Future<int?> _fetchMaxOrderIndex({
    required String shoppingListId,
  }) async {
    final qs = await shoppingItemsRef(shoppingListId)
        .orderBy('orderIndex', descending: true)
        .limit(1)
        .get();
    return qs.docs.firstOrNull?.data().orderIndex;
  }
}

@Riverpod(
  dependencies: [],
)
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
  String shoppingListId,
) {
  final shoppingItemRepository = ref.watch(shoppingItemRepositoryProvider);
  return shoppingItemRepository.watchShoppingItems(
    shoppingListId: shoppingListId,
  );
}

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
Future<List<ShoppingItem>> shoppingItemsFuture(
  Ref ref,
  String shoppingListId,
) {
  final shoppingItemRepository = ref.watch(shoppingItemRepositoryProvider);
  return shoppingItemRepository.listShoppingItems(
    shoppingListId: shoppingListId,
  );
}

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
Stream<bool> hasAnyPurchasedShoppingItemStream(
  Ref ref,
  String shoppingListId,
) {
  final shoppingItemRepository = ref.watch(shoppingItemRepositoryProvider);
  return shoppingItemRepository.watchHasAnyPurchasedShoppingItem(
    shoppingListId: shoppingListId,
  );
}

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
Future<ShoppingItem?> shoppingItemFuture(
  Ref ref,
  String shoppingListId,
  String shoppingItemId,
) async {
  final shoppingItemRepository = ref.watch(shoppingItemRepositoryProvider);
  try {
    return await shoppingItemRepository.fetchShoppingItem(
      shoppingListId: shoppingListId,
      shoppingItemId: shoppingItemId,
    );
  } catch (e) {
    if (e is FirebaseException && e.code == 'permission-denied') {
      throw PermissionDeniedException(e.message ?? '', {
        'ref': shoppingItemRepository.shoppingItemRef(
          shoppingListId,
          shoppingItemId,
        ),
      });
    }
    rethrow;
  }
}
