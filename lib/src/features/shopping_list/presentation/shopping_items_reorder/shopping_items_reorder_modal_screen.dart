import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/loading_widget.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_reorder/reorderable_shopping_items_list_tile.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_reorder/reorderable_shopping_items_list_view.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_reorder/shopping_items_reorder_controller.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';

class ShoppingItemsReorderModalScreen extends HookConsumerWidget {
  const ShoppingItemsReorderModalScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      shoppingItemsReorderControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    return HookConsumer(
      builder: (context, ref, child) {
        final initialShoppingItemsAsyncValue = ref.watch(
          shoppingItemsFutureProvider(shoppingListId),
        );

        if (initialShoppingItemsAsyncValue.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final initialShoppingItems = initialShoppingItemsAsyncValue.value ?? [];

        return HookBuilder(
          builder: (context) {
            final shoppingItems = useRef(initialShoppingItems);

            Future<void> submit() async {
              await ref
                  .read(shoppingItemsReorderControllerProvider.notifier)
                  .updateShoppingItemOrderIndexes(
                    shoppingListId: shoppingListId,
                    shoppingItems: shoppingItems.value,
                  );

              if (context.mounted) {
                context.pop();
              }
            }

            return LoadingWidget(
              isProcessing: false,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('買い物アイテムの並び替え'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: submit,
                    ),
                  ],
                ),
                body: ReorderableShoppingItemsListView.builder(
                  initialShoppingItems: shoppingItems.value,
                  onChanged: (newShoppingItems) {
                    shoppingItems.value = newShoppingItems;
                  },
                  itemBuilder: (context, shoppingItem) {
                    return ReorderableShoppingItemsListTile(
                      key: ValueKey(shoppingItem.id),
                      shoppingItem: shoppingItem,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
