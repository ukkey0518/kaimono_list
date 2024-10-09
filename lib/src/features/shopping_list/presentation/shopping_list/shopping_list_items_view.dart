import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/loading_widget.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items/shopping_items_list_tile.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items/shopping_items_list_view.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/empty_shopping_items_place_holder.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_edit_bottom_sheet.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/shopping_list_controller.dart';

class ShoppingListItemsView extends ConsumerWidget {
  const ShoppingListItemsView({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingItemsAsyncValue = ref.watch(
      shoppingItemsStreamProvider(shoppingListId),
    );

    final shoppingItems = shoppingItemsAsyncValue.value ?? [];

    Future<void> showShoppingItemForm(ShoppingItem shoppingItem) async {
      final controller = ref.read(shoppingListControllerProvider.notifier);
      final newShoppingItem = await ShoppingItemEditBottomSheet.show(
        context,
        shoppingItem: shoppingItem,
      );
      if (newShoppingItem == null) {
        return;
      }
      await controller.saveShoppingItem(
        shoppingListId: shoppingListId,
        shoppingItem: newShoppingItem,
      );
    }

    return LoadingWidget(
      isProcessing: shoppingItemsAsyncValue.isLoading,
      child: () {
        if (shoppingItems.isEmpty) {
          return const Center(
            child: EmptyShoppingItemPlaceHolder(),
          );
        }
        return ShoppingItemsListView.builder(
          shoppingItems: shoppingItems,
          itemBuilder: (context, shoppingItem) {
            return ShoppingItemsListTile(
              shoppingItem: shoppingItem,
              onIsPurchasedChanged: (isPurchased) => ref
                  .read(shoppingListControllerProvider.notifier)
                  .updateShoppingItemIsPurchased(
                    shoppingListId: shoppingListId,
                    shoppingItemId: shoppingItem.id!,
                    isPurchased: isPurchased,
                  ),
              onTap: () => showShoppingItemForm(shoppingItem),
            );
          },
        );
      }(),
    );
  }
}
