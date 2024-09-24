import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/empty_shopping_items_place_holder.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_list_tile.dart';

class ShoppingItemListView extends ConsumerWidget {
  const ShoppingItemListView({
    required this.shoppingListId,
    required this.onIsPurchasedChanged,
    required this.onEditShoppingItem,
    super.key,
  });

  final String shoppingListId;
  final ValueChanged<(String, bool)> onIsPurchasedChanged;
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
        return ShoppingItemListTile(
          shoppingItem: shoppingItem,
          onIsPurchasedChanged: (value) => onIsPurchasedChanged(
            (shoppingItem.id!, value),
          ),
          onEditShoppingItem: () => onEditShoppingItem(shoppingItem),
        );
      },
    );
  }
}
