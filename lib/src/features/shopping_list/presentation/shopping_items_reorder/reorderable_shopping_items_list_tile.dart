import 'package:flutter/material.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';

class ReorderableShoppingItemsListTile extends StatelessWidget {
  const ReorderableShoppingItemsListTile({
    required this.shoppingItem,
    super.key,
  });

  final ShoppingItem shoppingItem;

  @override
  Widget build(BuildContext context) {
    final isPurchased = shoppingItem.isPurchased ?? false;

    return Material(
      color: Theme.of(context).listTileTheme.tileColor,
      child: ListTile(
        leading: Checkbox(
          value: isPurchased,
          side: Theme.of(context).checkboxTheme.side?.copyWith(
                color: Theme.of(context)
                    .checkboxTheme
                    .side
                    ?.color
                    .withOpacity(0.8),
              ),
          activeColor: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          onChanged: (_) {},
        ),
        title: Text(
          shoppingItem.name ?? '',
          style: TextStyle(
            decoration:
                isPurchased ? TextDecoration.lineThrough : TextDecoration.none,
            color: isPurchased ? Colors.grey : Colors.black,
          ),
        ),
        trailing: const Icon(
          Icons.drag_handle,
        ),
      ),
    );
  }
}
