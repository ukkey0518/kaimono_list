import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/progress_widget.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/add_shopping_item_fab.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/clean_shopping_items_confirm_dialog.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/clean_shopping_items_fab.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/delete_shopping_item_confirm_dialog.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/empty_shopping_items_place_holder.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/shopping_item_form_bottom_sheet.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/shopping_item_list_tile.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_list/shopping_items_list_controller.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ShoppingItemsListScreen extends ConsumerWidget {
  const ShoppingItemsListScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      shoppingItemsListControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> showShoppingItemForm([ShoppingItem? shoppingItem]) async {
      final controller = ref.read(shoppingItemsListControllerProvider.notifier);
      final newShoppingItem = await ShoppingItemFormBottomSheet.show(
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
          .read(shoppingItemsListControllerProvider.notifier)
          .deleteAllPurchasedShoppingItems(shoppingListId);
    }

    return GestureDetector(
      onTap: unFocusAll,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, _) {
              final shoppingListAsyncValue = ref.watch(
                shoppingListFutureProvider(shoppingListId),
              );
              final shoppingList = shoppingListAsyncValue.value;
              return Text(shoppingList?.name ?? '');
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.reorder),
              onPressed: () => ShoppingItemsReorderModalRoute(
                shoppingListId: shoppingListId,
              ).go(context),
            ),
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
                    child: CleanShoppingItemsFab(
                      onPressed: cleanShoppingItems,
                    ),
                  ),
                );
              },
            ),
            const Gap(Sizes.p16),
            AddShoppingItemFab(
              onPressed: showShoppingItemForm,
            ),
          ],
        ),
        body: SafeArea(
          child: Consumer(
            builder: (context, ref, _) {
              final shoppingItemsAsyncValue = ref.watch(
                shoppingItemsStreamProvider(shoppingListId),
              );
              final shoppingItems = shoppingItemsAsyncValue.value ?? [];

              return ProgressBuilder(
                isLoading: shoppingItemsAsyncValue.isLoading,
                builder: (context) {
                  if (shoppingItems.isEmpty) {
                    return const Center(
                      child: EmptyShoppingItemsPlaceHolder(),
                    );
                  }

                  return ListView.builder(
                    itemCount: shoppingItems.length,
                    itemBuilder: (context, index) {
                      final shoppingItem = shoppingItems[index];

                      Future<void> updateIsPurchased(bool newValue) async {
                        unawaited(HapticFeedback.selectionClick());
                        await ref
                            .read(shoppingItemsListControllerProvider.notifier)
                            .updateShoppingItemIsPurchased(
                              shoppingListId: shoppingListId,
                              shoppingItemId: shoppingItem.id!,
                              isPurchased: newValue,
                            );
                      }

                      Future<bool> confirmDelete() {
                        return DeleteShoppingItemConfirmDialog.show(
                          context,
                          shoppingItem: shoppingItem,
                        );
                      }

                      Future<void> deleteShoppingItem() {
                        return ref
                            .read(shoppingItemsListControllerProvider.notifier)
                            .deleteShoppingItem(
                              shoppingListId,
                              shoppingItem.id!,
                            );
                      }

                      return Dismissible(
                        key: ValueKey(shoppingItem.id),
                        confirmDismiss: (_) => confirmDelete(),
                        onDismissed: (_) => deleteShoppingItem(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: Sizes.p16),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: ShoppingItemListTile(
                          shoppingItem: shoppingItem,
                          onPurchasedChanged: updateIsPurchased,
                          onTap: () => showShoppingItemForm(shoppingItem),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
