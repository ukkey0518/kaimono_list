import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/data/user_shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists/components/shopping_list_add_tile.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists/components/shopping_list_navigation_tile.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';

class ShoppingListsNavigationListView extends ConsumerWidget {
  const ShoppingListsNavigationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userShoppingListsAsyncValue =
        ref.watch(userShoppingListsStreamProvider);

    if (userShoppingListsAsyncValue.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final userShoppingLists = userShoppingListsAsyncValue.value ?? [];

    return ListView(
      children: [
        for (final userShoppingList in userShoppingLists)
          UserShoppingListTile(
            userShoppingList: userShoppingList,
            onTap: () => ShoppingListRoute(
              shoppingListId: userShoppingList.id!,
            ).go(context),
          ),
        ShoppingListAddTile(
          onTap: () => const ShoppingListAddRoute().go(context),
        ),
      ],
    );
  }
}
