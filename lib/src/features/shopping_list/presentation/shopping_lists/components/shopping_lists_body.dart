import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/data/user_shopping_list_setting_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/empty_shopping_list/empty_shopping_list_page.dart';

class ShoppingListsBody extends ConsumerWidget {
  const ShoppingListsBody({
    required this.onAddShoppingList,
    super.key,
  });

  final VoidCallback? onAddShoppingList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userShoppingListsAsyncValue = ref.watch(
      userShoppingListsStreamProvider,
    );

    if (userShoppingListsAsyncValue.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final userShoppingLists = userShoppingListsAsyncValue.value ?? [];

    if (userShoppingLists.isEmpty) {
      return EmptyShoppingListPage(
        onAddShoppingList: onAddShoppingList,
      );
    }

    return ListView.builder(
      itemCount: userShoppingLists.length,
      itemBuilder: (context, index) {
        final userShoppingList = userShoppingLists[index];
        return ListTile(
          title: Text(userShoppingList.name),
        );
      },
    );
  }
}
