import 'package:flutter/material.dart';
import 'package:kaimono_list/src/features/item/presentation/empty_shopping_list_page/components/add_shopping_list_button.dart';
import 'package:kaimono_list/src/features/item/presentation/empty_shopping_list_page/components/empty_shopping_list_placeholder.dart';

class EmptyShoppingListPage extends StatelessWidget {
  const EmptyShoppingListPage({
    required this.onAddShoppingList,
    super.key,
  });

  final VoidCallback? onAddShoppingList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EmptyShoppingListPlaceholder(),
          const SizedBox(height: 32),
          AddShoppingListButton(
            onAddShoppingList: onAddShoppingList,
          ),
        ],
      ),
    );
  }
}
