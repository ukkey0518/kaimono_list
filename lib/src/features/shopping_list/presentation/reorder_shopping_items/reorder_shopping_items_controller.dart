import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reorder_shopping_items_controller.g.dart';

@Riverpod(
  dependencies: [
    shoppingItemRepository,
  ],
)
class ReorderShoppingItemsController extends _$ReorderShoppingItemsController {
  @override
  FutureOr<void> build() async => null;

  Future<void> updateShoppingItemOrderIndexes({
    required String shoppingListId,
    required List<ShoppingItem> shoppingItems,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final shoppingItemRepository = ref.read(
        shoppingItemRepositoryProvider,
      );
      final reversedShoppingItems = shoppingItems.reversed.toList();
      final updatedShoppingItems = <ShoppingItem>[];
      for (var i = 0; i < reversedShoppingItems.length; i++) {
        final shoppingItem = reversedShoppingItems[i];
        updatedShoppingItems.add(
          shoppingItem.copyWith(orderIndex: i),
        );
      }
      await shoppingItemRepository.updateShoppingItemOrderIndexes(
        shoppingListId: shoppingListId,
        shoppingItems: updatedShoppingItems,
      );
    });
  }
}
