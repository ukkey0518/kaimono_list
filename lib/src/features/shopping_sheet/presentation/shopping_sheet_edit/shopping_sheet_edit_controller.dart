import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_sheet_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_sheet_edit_controller.g.dart';

@Riverpod(
  dependencies: [
    shoppingSheetRepository,
    shoppingItemRepository,
    shoppingSheetFuture,
    shoppingSheetsByUserFuture,
  ],
)
class ShoppingSheetEditController extends _$ShoppingSheetEditController {
  @override
  FutureOr<void> build() async => null;

  Future<void> updateShoppingSheetTitle(
    String shoppingSheetId,
    String title,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(shoppingSheetRepositoryProvider).updateTitle(
            shoppingSheetId: shoppingSheetId,
            title: title,
          );
      ref
        ..invalidate(shoppingSheetFutureProvider(shoppingSheetId))
        ..invalidate(shoppingSheetsByUserFutureProvider);
    });
  }

  Future<void> deleteShoppingSheet(
    String shoppingSheetId,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(shoppingItemRepositoryProvider)
          .deleteAll(shoppingSheetId: shoppingSheetId);
      await ref
          .read(shoppingSheetRepositoryProvider)
          .delete(shoppingSheetId: shoppingSheetId);
      ref.invalidate(shoppingSheetsByUserFutureProvider);
    });
  }
}
