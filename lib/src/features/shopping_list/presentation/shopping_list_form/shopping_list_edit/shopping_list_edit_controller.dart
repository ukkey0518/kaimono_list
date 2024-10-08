import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_list_edit_controller.g.dart';

@Riverpod(
  dependencies: [
    shoppingListRepository,
    shoppingItemRepository,
  ],
)
class ShoppingListEditController extends _$ShoppingListEditController {
  @override
  FutureOr<void> build() async => null;

  Future<void> updateShoppingList(
    String shoppingListId,
    String name,
  ) async {
    final shoppingListRepository = ref.read(
      shoppingListRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await shoppingListRepository.updateShoppingListInfo(
        shoppingListId,
        name,
      );
    });
  }

  Future<void> deleteShoppingList(
    String shoppingListId,
  ) async {
    final shoppingListRepository = ref.read(
      shoppingListRepositoryProvider,
    );
    final shoppingItemRepository = ref.read(
      shoppingItemRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // TODO(Ukkey): Make it a batch process or use `recursiveDelete` in AdminSDK.
      await shoppingItemRepository.deleteAllShoppingItems(
        shoppingListId: shoppingListId,
      );
      await shoppingListRepository.deleteShoppingList(
        shoppingListId,
      );
    });
  }
}
