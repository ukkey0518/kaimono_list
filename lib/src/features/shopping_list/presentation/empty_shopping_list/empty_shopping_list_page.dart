import 'package:flutter/material.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/empty_shopping_list/components/empty_shopping_list_placeholder.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

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
          ElevatedButton.icon(
            onPressed: onAddShoppingList,
            icon: const Icon(Icons.add),
            label: Text('New List'.hardcoded),
          ),
        ],
      ),
    );
  }
}
