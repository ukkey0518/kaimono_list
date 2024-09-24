import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_list_tile.dart';
import 'package:kaimono_list/src/utils/types/two_value_changed.dart';

class ShoppingItemListView extends ConsumerWidget {
  const ShoppingItemListView({
    required this.shoppingItems,
    required this.onIsPurchasedChanged,
    required this.onEditShoppingItem,
    super.key,
  });

  final List<ShoppingItem> shoppingItems;
  final TwoValueChanged<String, bool> onIsPurchasedChanged;
  final ValueChanged<ShoppingItem> onEditShoppingItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: shoppingItems.length,
      padding: const EdgeInsets.only(bottom: Sizes.p128),
      itemBuilder: (context, index) {
        final shoppingItem = shoppingItems[index];
        return ShoppingItemListTile(
          shoppingItem: shoppingItem,
          onIsPurchasedChanged: (value) => onIsPurchasedChanged(
            shoppingItem.id!,
            value,
          ),
          onEditShoppingItem: () => onEditShoppingItem(shoppingItem),
        );
      },
    );
  }
}
