import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_items_list_controller.g.dart';

@riverpod
class ShoppingItemsListController extends _$ShoppingItemsListController {
  @override
  FutureOr<void> build() async => null;

  Future<void> createShoppingItem({
    required String shoppingSheetId,
    required ShoppingItem shoppingItem,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(shoppingItemRepositoryProvider)
          .create(shoppingSheetId: shoppingSheetId, shoppingItem: shoppingItem);
    });
  }

  Future<void> updateShoppingItemName({
    required String shoppingSheetId,
    required String shoppingItemId,
    required String name,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(shoppingItemRepositoryProvider)
          .updateName(
            shoppingSheetId: shoppingSheetId,
            shoppingItemId: shoppingItemId,
            name: name,
          );
    });
  }

  Future<void> saveShoppingItem({
    required String shoppingSheetId,
    required ShoppingItem shoppingItem,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(shoppingItemRepositoryProvider);
      final shoppingItemId = shoppingItem.id;
      if (shoppingItemId == null) {
        // * If the shopping item has no ID, it's a new item
        await repository.create(
          shoppingSheetId: shoppingSheetId,
          shoppingItem: shoppingItem,
        );
      } else {
        // * If the shopping item has an ID, it's an existing item
        await repository.updateName(
          shoppingSheetId: shoppingSheetId,
          shoppingItemId: shoppingItemId,
          name: shoppingItem.name ?? '',
        );
      }
    });
  }

  Future<void> updateShoppingItemIsCompleted({
    required String shoppingSheetId,
    required String shoppingItemId,
    required bool isCompleted,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(shoppingItemRepositoryProvider)
          .updateIsCompleted(
            shoppingSheetId: shoppingSheetId,
            shoppingItemId: shoppingItemId,
            isCompleted: isCompleted,
          );
    });
  }

  Future<void> deleteShoppingItem(
    String shoppingSheetId,
    String shoppingItemId,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(shoppingItemRepositoryProvider)
          .delete(
            shoppingSheetId: shoppingSheetId,
            shoppingItemId: shoppingItemId,
          );
    });
  }

  Future<void> deleteAllPurchasedShoppingItems(String shoppingSheetId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(shoppingItemRepositoryProvider)
          .deleteListCompleted(shoppingSheetId: shoppingSheetId);
    });
  }
}
