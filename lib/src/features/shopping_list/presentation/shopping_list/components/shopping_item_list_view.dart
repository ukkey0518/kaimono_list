import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/empty_shopping_items_place_holder.dart';

class ShoppingItemListView extends ConsumerWidget {
  const ShoppingItemListView({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implements shoppingItemsProvider
    const shoppingItemsAsyncValue = AsyncValue<List<({String name})>>.data([]);

    if (shoppingItemsAsyncValue.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final shoppingItems = shoppingItemsAsyncValue.value ?? [];

    if (shoppingItems.isEmpty) {
      return const Center(
        child: EmptyShoppingItemPlaceHolder(),
      );
    }

    return ListView.builder(
      itemCount: shoppingItems.length,
      itemBuilder: (context, index) {
        final shoppingItem = shoppingItems[index];
        return ListTile(
          title: Text(shoppingItem.name),
        );
      },
    );
  }
}
