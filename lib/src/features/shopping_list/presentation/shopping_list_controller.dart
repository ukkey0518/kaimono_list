import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_list_controller.g.dart';

@Riverpod(
  dependencies: [
    currentUser,
    shoppingListRepository,
  ],
)
class ShoppingListController extends _$ShoppingListController {
  @override
  FutureOr<void> build() => null;

  Future<void> createNewShoppingList(ShoppingList shoppingList) async {
    final currentUser = ref.watch(currentUserProvider);
    final shoppingListRepository = ref.watch(
      shoppingListRepositoryProvider,
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await shoppingListRepository.createShoppingList(
        shoppingList.copyWith(
          ownerUserId: currentUser!.id,
        ),
      );
    });
  }
}