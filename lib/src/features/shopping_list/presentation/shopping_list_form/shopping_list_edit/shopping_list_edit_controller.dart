import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_list_edit_controller.g.dart';

@Riverpod(
  dependencies: [
    currentUser,
    shoppingListRepository,
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
      await shoppingListRepository.updateShoppingList(
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
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await shoppingListRepository.deleteShoppingList(
        shoppingListId,
      );
    });
  }
}
