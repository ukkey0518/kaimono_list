import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/exceptions/permission_denied_exception.dart';
import 'package:kaimono_list/src/features/error/presentation/error_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_list_view.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/app_logger.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ShoppingListScreen extends ConsumerWidget {
  const ShoppingListScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingListAsyncValue = ref.watch(
      shoppingListFutureProvider(
        shoppingListId,
      ),
    );

    if (shoppingListAsyncValue.hasError) {
      return ErrorScreen(
        error: switch (shoppingListAsyncValue.error.runtimeType) {
          PermissionDeniedException => 'この買い物リストにアクセスする権限がありません'.hardcoded,
          _ => shoppingListAsyncValue.error,
        },
        stackTrace: shoppingListAsyncValue.stackTrace,
      );
    }

    final shoppingList = shoppingListAsyncValue.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList?.name ?? ''),
        actions: [
          if (!shoppingListAsyncValue.isLoading && shoppingList != null)
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => ShoppingListEditRoute(
                shoppingListId: shoppingListId,
              ).go(context),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // TODO(Ukkey): Implement add shopping item
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ShoppingItemListView(
        shoppingListId: shoppingListId,
      ),
    );
  }
}
