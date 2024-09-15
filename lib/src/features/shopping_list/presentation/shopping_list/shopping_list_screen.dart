import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_list_view.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ShoppingListScreen extends ConsumerWidget {
  const ShoppingListScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final shoppingListAsyncValue = ref.watch(
              shoppingListFutureProvider(
                shoppingListId,
              ),
            );
            if (shoppingListAsyncValue.isLoading) {
              return const CircularProgressIndicator();
            }
            if (shoppingListAsyncValue.hasError) {
              // TODO(Ukkey): Implement error logging
              debugPrint(shoppingListAsyncValue.error.toString());
              debugPrint(shoppingListAsyncValue.stackTrace.toString());
              return Text('エラー'.hardcoded);
            }
            return Text(shoppingListAsyncValue.value?.name ?? '');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            // TODO(Ukkey): Implement edit shopping list
            onPressed: () {},
          ),
        ],
      ),
      body: ShoppingItemListView(
        shoppingListId: shoppingListId,
      ),
    );
  }
}
