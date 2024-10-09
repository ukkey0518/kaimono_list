import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';

class ShoppingItemsListTile extends StatelessWidget {
  const ShoppingItemsListTile({
    required this.shoppingItem,
    this.onIsPurchasedChanged,
    this.onTap,
    super.key,
  });

  final ShoppingItem shoppingItem;
  final ValueChanged<bool>? onIsPurchasedChanged;
  final VoidCallback? onTap;

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
      onTap: onTap,
    );
  }
}
