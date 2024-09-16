import 'package:cloud_firestore/cloud_firestore.dart';
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
    return shoppingItemsRef(shoppingListId).snapshots().map(
          (qs) => qs.docs.map((ds) => ds.data()).toList(),
        );
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
    final validationErrorMessage = shoppingItem.validateForCreate();
    if (validationErrorMessage != null) {
      throw ModelValidationException(validationErrorMessage, shoppingItem);
    }
    final ref = await shoppingItemsRef(shoppingListId).add(shoppingItem);
    return ref.id;
  }

  Future<void> updateShoppingItemInfo({
    required String shoppingListId,
    required String shoppingItemId,
    required String name,
  }) async {
    if (name.isEmpty) {
      throw ModelValidationException('`name` is required.', {
        'name': name,
      });
    }
    await shoppingItemRef(shoppingListId, shoppingItemId).update(
      {
        'name': name,
      },
    );
  }

  Future<void> toggleShoppingItemIsPurchased({
    required String shoppingListId,
    required String shoppingItemId,
  }) async {
    await _firestore.runTransaction((transaction) async {
      final ref = shoppingItemRef(shoppingListId, shoppingItemId);
      final ds = await transaction.get(ref);
      final shoppingItem = ds.data();
      if (shoppingItem == null) {
        // TODO(Ukkey): Add a custom exception class.
        throw Exception('ShoppingItem not found.');
      }
      transaction.update(
        ref,
        {
          'isPurchased': !shoppingItem.isPurchased,
        },
      );
    });
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
}

@Riverpod(
  dependencies: [],
)
ShoppingItemRepository shoppingItemRepository(ShoppingItemRepositoryRef ref) {
  return ShoppingItemRepository(FirebaseFirestore.instance);
}

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
Stream<List<ShoppingItem>> shoppingItemsStream(
  ShoppingItemsStreamRef ref,
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
Future<ShoppingItem?> shoppingItemFuture(
  ShoppingItemFutureRef ref,
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
