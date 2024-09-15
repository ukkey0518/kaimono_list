import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_list_add_controller.g.dart';

@Riverpod(
  dependencies: [
    currentUser,
    shoppingListRepository,
  ],
)
class ShoppingListAddController extends _$ShoppingListAddController {
  @override
  FutureOr<void> build() async => null;

  Future<String?> createNewShoppingList(String name) async {
    final currentUser = ref.read(currentUserProvider);
    final shoppingListRepository = ref.read(
      shoppingListRepositoryProvider,
    );
    String? newShoppingListId;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      newShoppingListId = await shoppingListRepository.createShoppingList(
        ShoppingList(
          name: name,
          ownerUserId: currentUser!.id,
        ),
      );
    });
    return newShoppingListId;
  }
}
