import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';

class ShoppingItemListTile extends StatelessWidget {
  const ShoppingItemListTile({
    required this.shoppingItem,
    required this.onIsPurchasedChanged,
    required this.onEditShoppingItem,
    super.key,
  });

  final ShoppingItem shoppingItem;
  final ValueChanged<bool>? onIsPurchasedChanged;
  final VoidCallback? onEditShoppingItem;

  @override
  Widget build(BuildContext context) {
    final isPurchased = shoppingItem.isPurchased ?? false;

    return ListTile(
      leading: Checkbox(
        value: shoppingItem.isPurchased,
        onChanged: onIsPurchasedChanged == null
            ? null
            : (value) {
                HapticFeedback.selectionClick();
                onIsPurchasedChanged!(value!);
              },
      ),
      title: Text(
        shoppingItem.name ?? '',
        style: TextStyle(
          decoration:
              isPurchased ? TextDecoration.lineThrough : TextDecoration.none,
          color: isPurchased ? Colors.grey : Colors.black,
        ),
      ),
      onTap: onEditShoppingItem,
    );
  }
}
