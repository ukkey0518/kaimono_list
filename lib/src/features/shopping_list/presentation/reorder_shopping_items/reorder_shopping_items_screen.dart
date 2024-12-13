import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/reorder_shopping_items/reorder_shopping_items_controller.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/shopping_item_list_tile.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';

class ReorderShoppingItemsScreen extends HookConsumerWidget {
  const ReorderShoppingItemsScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialShoppingItemsAsyncValue = ref.watch(
      shoppingItemsFutureProvider(shoppingListId),
    );
    final initialShoppingItems = initialShoppingItemsAsyncValue.value ?? [];

    if (initialShoppingItemsAsyncValue.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    ref.listen(
      reorderShoppingItemsControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    return HookBuilder(
      builder: (context) {
        final shoppingItems = useState(initialShoppingItems);

        Future<void> submit() async {
          await ref
              .read(reorderShoppingItemsControllerProvider.notifier)
              .updateShoppingItemOrderIndexes(
                shoppingListId: shoppingListId,
                shoppingItems: shoppingItems.value,
              );
          if (context.mounted) {
            context.pop();
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('買い物アイテムの並び替え'),
            actions: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: submit,
              ),
            ],
          ),
          body: ImplicitlyAnimatedReorderableList(
            items: shoppingItems.value,
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            onReorderFinished: (item, from, to, newItems) {
              shoppingItems.value = newItems;
            },
            itemBuilder: (context, animation, shoppingItem, index) {
              return Reorderable(
                key: ValueKey(shoppingItem.id),
                child: SizeFadeTransition(
                  animation: animation,
                  curve: Curves.fastOutSlowIn,
                  child: ShoppingItemListTile(
                    shoppingItem: shoppingItem,
                    trailing: const Handle(
                      delay: Duration(milliseconds: 100),
                      child: Icon(
                        Icons.drag_handle,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
