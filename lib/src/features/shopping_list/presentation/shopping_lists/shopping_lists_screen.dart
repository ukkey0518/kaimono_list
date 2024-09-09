import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/item/domain/shopping_list.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/add_shopping_list/add_shopping_list_dialog.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists/components/shopping_lists_body.dart';

class ShoppingListsScreen extends ConsumerWidget {
  const ShoppingListsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> showAddShoppingListDialog() async {
      final newShoppingList = await showDialog<ShoppingList?>(
        context: context,
        builder: (context) => const AddShoppingListDialog(),
      );
      if (newShoppingList == null) {
        return;
      }
      // TODO(Ukkey): Add new shopping list to Firestore
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Lists'),
      ),
      body: ShoppingListsBody(
        onAddShoppingList: showAddShoppingListDialog,
      ),
    );
  }
}
