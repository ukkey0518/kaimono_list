import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/utils/types/value_widget_builder.dart';

class ReorderableShoppingItemsListView extends HookWidget {
  const ReorderableShoppingItemsListView.builder({
    required this.initialShoppingItems,
    required this.onChanged,
    required this.itemBuilder,
    super.key,
  });

  final List<ShoppingItem> initialShoppingItems;
  final ValueChanged<List<ShoppingItem>> onChanged;
  final AppValueWidgetBuilder<ShoppingItem> itemBuilder;

  @override
  Widget build(BuildContext context) {
    final shoppingItems = useState(initialShoppingItems);

    void onReorder(int oldIndex, int newIndex) {
      final newShoppingItems = [...shoppingItems.value];
      final shoppingItem = newShoppingItems.removeAt(oldIndex);
      newShoppingItems.insert(newIndex, shoppingItem);
      shoppingItems.value = newShoppingItems;

      onChanged(newShoppingItems);
    }

    return AnimatedReorderableListView(
      items: shoppingItems.value,
      onReorder: onReorder,
      longPressDraggable: false,
      itemBuilder: (context, index) {
        final shoppingItem = shoppingItems.value[index];
        return itemBuilder(
          context,
          shoppingItem,
        );
      },
    );
  }
}
