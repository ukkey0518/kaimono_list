import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/loading_widget.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_list.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/add_shopping_list_dialog.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_controller.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists/components/shopping_lists_body.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';

class ShoppingListsScreen extends ConsumerWidget {
  const ShoppingListsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      shoppingListControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> showAddShoppingListDialog() async {
      final newShoppingList = await showDialog<ShoppingList?>(
        context: context,
        builder: (context) => const AddShoppingListDialog(),
      );
      if (newShoppingList == null) {
        return;
      }
      await ref
          .read(shoppingListControllerProvider.notifier)
          .createNewShoppingList(newShoppingList);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Lists'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final isLoading = ref.watch(shoppingListControllerProvider).isLoading;
          return LoadingWidget(
            isProcessing: isLoading,
            child: ShoppingListsBody(
              onAddShoppingList: showAddShoppingListDialog,
            ),
          );
        },
      ),
    );
  }
}
