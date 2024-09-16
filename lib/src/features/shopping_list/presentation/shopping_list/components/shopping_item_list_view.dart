import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/empty_shopping_items_place_holder.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/shopping_list_controller.dart';

class ShoppingItemListView extends ConsumerWidget {
  const ShoppingItemListView({
    required this.shoppingListId,
    required this.onEditShoppingItem,
    super.key,
  });

  final String shoppingListId;
  final ValueChanged<ShoppingItem> onEditShoppingItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingItemsAsyncValue = ref.watch(
      shoppingItemsStreamProvider(
        shoppingListId,
      ),
    );

    if (shoppingItemsAsyncValue.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final shoppingItems = shoppingItemsAsyncValue.value ?? [];

    if (shoppingItems.isEmpty) {
      return const Center(
        child: EmptyShoppingItemPlaceHolder(),
      );
    }

    return ListView.builder(
      itemCount: shoppingItems.length,
      padding: const EdgeInsets.only(bottom: Sizes.p128),
      itemBuilder: (context, index) {
        final shoppingItem = shoppingItems[index];
        return ListTile(
          leading: Checkbox(
            value: shoppingItem.isPurchased,
            onChanged: (value) => ref
                .read(shoppingListControllerProvider.notifier)
                .updateShoppingItemIsPurchased(
                  shoppingListId: shoppingListId,
                  shoppingItemId: shoppingItem.id!,
                  isPurchased: value!,
                ),
          ),
          title: Text(
            shoppingItem.name,
            style: TextStyle(
              decoration: shoppingItem.isPurchased
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: shoppingItem.isPurchased ? Colors.grey : Colors.black,
            ),
          ),
          onTap: () => onEditShoppingItem(shoppingItem),
        );
      },
    );
  }
}
