import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_add_fab.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_clean_fab.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_edit_bottom_sheet.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/dialogs/clean_shopping_items_confirm_dialog.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/shopping_list_controller.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/shopping_list_items_view.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/routing/initial_location_controller.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ShoppingListScreen extends HookConsumerWidget {
  const ShoppingListScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(initialLocationControllerProvider.notifier).setInitialLocation(
              ShoppingListRoute(shoppingListId: shoppingListId).location,
            );
        return null;
      },
      [shoppingListId],
    );

    ref.listen(
      shoppingListControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> showShoppingItemForm([ShoppingItem? shoppingItem]) async {
      final controller = ref.read(shoppingListControllerProvider.notifier);
      final newShoppingItem = await ShoppingItemEditBottomSheet.show(
        context,
        shoppingItem: shoppingItem,
      );
      if (newShoppingItem == null) {
        return;
      }
      await controller.saveShoppingItem(
        shoppingListId: shoppingListId,
        shoppingItem: newShoppingItem,
      );
    }

    Future<void> cleanShoppingItems() async {
      final isConfirmed = await CleanShoppingItemsConfirmDialog.show(context);
      if (!isConfirmed) {
        return;
      }
      await ref
          .read(shoppingListControllerProvider.notifier)
          .deleteAllPurchasedShoppingItems(shoppingListId);
    }

    return Consumer(
      builder: (context, ref, child) {
        final shoppingListAsyncValue = ref.watch(
          shoppingListFutureProvider(shoppingListId),
        );
        final shoppingList = shoppingListAsyncValue.value;

        return GestureDetector(
          onTap: unFocusAll,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(shoppingList?.name ?? ''),
              actions: [
                IconButton(
                  icon: const Icon(Icons.reorder),
                  onPressed: () => ShoppingItemsReorderModalRoute(
                    shoppingListId: shoppingListId,
                  ).go(context),
                ),
                if (!shoppingListAsyncValue.isLoading && shoppingList != null)
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => ShoppingListEditRoute(
                      shoppingListId: shoppingListId,
                    ).go(context),
                  ),
              ],
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final hasAnyPurchasedShoppingItem = ref.watch(
                      hasAnyPurchasedShoppingItemStreamProvider(
                        shoppingListId,
                      ),
                    );
                    final isShowing = !hasAnyPurchasedShoppingItem.isLoading &&
                        hasAnyPurchasedShoppingItem.hasValue &&
                        hasAnyPurchasedShoppingItem.value!;
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isShowing ? 1 : 0,
                      child: IgnorePointer(
                        ignoring: !isShowing,
                        child: ShoppingItemCleanFab(
                          onPressed: cleanShoppingItems,
                        ),
                      ),
                    );
                  },
                ),
                const Gap(Sizes.p16),
                ShoppingItemAddFab(
                  onPressed: showShoppingItemForm,
                ),
              ],
            ),
            body: SafeArea(
              child: ShoppingListItemsView(
                shoppingListId: shoppingListId,
              ),
            ),
          ),
        );
      },
    );
  }
}
