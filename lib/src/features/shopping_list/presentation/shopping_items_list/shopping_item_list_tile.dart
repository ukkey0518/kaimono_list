import 'package:flutter/material.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';

class ShoppingItemListTile extends StatelessWidget {
  const ShoppingItemListTile({
    required this.shoppingItem,
    this.onPurchasedChanged,
    this.onTap,
    this.trailing,
    super.key,
  });

  final ShoppingItem shoppingItem;
  final ValueChanged<bool>? onPurchasedChanged;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final isEnabledCheckbox = onPurchasedChanged != null;
    final isPurchased = shoppingItem.isPurchased ?? false;

    return Material(
      color: Theme.of(context).listTileTheme.tileColor,
      child: ListTile(
        leading: Opacity(
          opacity: isEnabledCheckbox ? 1.0 : 0.5,
          child: Checkbox(
            value: shoppingItem.isPurchased,
            onChanged: isEnabledCheckbox
                ? (value) {
                    if (value == null) return;
                    onPurchasedChanged!(value);
                  }
                : null,
          ),
        ),
        title: Text(
          shoppingItem.name ?? '',
          style: isPurchased
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                )
              : const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
        ),
        onTap: onTap,
        trailing: trailing,
      ),
    );
  }
}
