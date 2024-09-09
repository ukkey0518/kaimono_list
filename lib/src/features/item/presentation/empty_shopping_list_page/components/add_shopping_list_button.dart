import 'package:flutter/material.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class AddShoppingListButton extends StatelessWidget {
  const AddShoppingListButton({
    required this.onAddShoppingList,
    super.key,
  });

  final VoidCallback? onAddShoppingList;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onAddShoppingList,
      icon: const Icon(Icons.add),
      label: Text('New List'.hardcoded),
    );
  }
}
