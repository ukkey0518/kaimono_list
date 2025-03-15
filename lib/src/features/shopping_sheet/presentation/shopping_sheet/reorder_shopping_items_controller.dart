import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_item_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reorder_shopping_items_controller.g.dart';

@riverpod
class ReorderShoppingItemsController extends _$ReorderShoppingItemsController {
  @override
  FutureOr<void> build() async => null;

  Future<void> reorderShoppingItems({
    required String shoppingSheetId,
    required List<String> sortedShoppingItemIds,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(shoppingItemRepositoryProvider).updateIndexes(
            shoppingSheetId: shoppingSheetId,
            sortedShoppingItemIds: sortedShoppingItemIds,
          );
    });
  }
}
