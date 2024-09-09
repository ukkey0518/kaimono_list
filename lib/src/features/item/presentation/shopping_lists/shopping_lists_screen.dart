import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/item/data/user_shopping_list_setting_repository.dart';
import 'package:kaimono_list/src/features/item/presentation/empty_shopping_list_page/empty_shopping_list_page.dart';
import 'package:kaimono_list/src/features/item/presentation/shopping_lists/user_shopping_lists_controller.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';

class ShoppingListsScreen extends ConsumerWidget {
  const ShoppingListsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userShoppingListsControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Lists'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

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
        onAddShoppingList: () {},
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
