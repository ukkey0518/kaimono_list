import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_list_controller.g.dart';

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
class ShoppingListController extends _$ShoppingListController {
  @override
  FutureOr<void> build() async => null;

  Future<String?> createNewShoppingItem({
    required String shoppingListId,
    required ShoppingItem shoppingItem,
  }) async {
    String? newShoppingItemId;
    final shoppingItemRepository = ref.read(
      shoppingItemRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      newShoppingItemId = await shoppingItemRepository.createShoppingItem(
        shoppingListId: shoppingListId,
        shoppingItem: shoppingItem,
      );
    });
    return newShoppingItemId;
  }

  Future<void> updateShoppingItemInfo({
    required String shoppingListId,
    required ShoppingItem shoppingItem,
  }) async {
    final shoppingItemRepository = ref.read(
      shoppingItemRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await shoppingItemRepository.updateShoppingItem(
        shoppingListId: shoppingListId,
        shoppingItem: shoppingItem.copyWith(
          // * 購入状態は更新しない
          isPurchased: null,
        ),
      );
    });
  }

  Future<void> updateShoppingItemIsPurchased({
    required String shoppingListId,
    required String shoppingItemId,
    required bool isPurchased,
  }) async {
    final shoppingItemRepository = ref.read(
      shoppingItemRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await shoppingItemRepository.updateShoppingItem(
        shoppingListId: shoppingListId,
        shoppingItem: ShoppingItem(
          id: shoppingItemId,
          isPurchased: isPurchased,
        ),
      );
    });
  }

  Future<void> deleteShoppingItem(
    String shoppingListId,
    String shoppingItemId,
  ) async {
    final shoppingItemRepository = ref.read(
      shoppingItemRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await shoppingItemRepository.deleteShoppingItem(
        shoppingListId: shoppingListId,
        shoppingItemId: shoppingItemId,
      );
    });
  }

  Future<void> deleteAllPurchasedShoppingItems(String shoppingListId) async {
    final shoppingItemRepository = ref.read(
      shoppingItemRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await shoppingItemRepository.deleteAllPurchasedShoppingItems(
        shoppingListId: shoppingListId,
      );
    });
  }
}
