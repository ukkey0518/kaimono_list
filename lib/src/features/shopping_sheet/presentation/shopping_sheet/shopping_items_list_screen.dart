import 'dart:async';

import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/dismissible.dart';
import 'package:kaimono_list/src/common_widgets/progress_widget.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_sheet_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/add_shopping_item_fab.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/clean_shopping_items_confirm_dialog.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/clean_shopping_items_fab.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/delete_shopping_item_confirm_dialog.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/empty_shopping_items_place_holder.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/shopping_item_form_bottom_sheet.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/shopping_item_list_tile.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/shopping_items_list_controller.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ShoppingItemsListScreen extends ConsumerWidget {
  const ShoppingItemsListScreen({
    required this.shoppingSheetId,
    super.key,
  });

  final String shoppingSheetId;

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

      if (shoppingItem != null) {
        await controller.updateShoppingItemName(
          shoppingSheetId: shoppingSheetId,
          shoppingItemId: shoppingItem.id!,
          name: newShoppingItem.name ?? '',
        );
      } else {
        await controller.createShoppingItem(
          shoppingSheetId: shoppingSheetId,
          shoppingItem: newShoppingItem,
        );
      }
    }

    Future<void> cleanShoppingItems() async {
      final isConfirmed = await CleanShoppingItemsConfirmDialog.show(context);
      if (!isConfirmed) {
        return;
      }
      await ref
          .read(shoppingItemsListControllerProvider.notifier)
          .deleteAllPurchasedShoppingItems(shoppingSheetId);
    }

    return GestureDetector(
      onTap: unFocusAll,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, _) {
              final shoppingSheetAsyncValue = ref.watch(
                shoppingSheetFutureProvider(shoppingSheetId),
              );
              final shoppingSheet = shoppingSheetAsyncValue.value;
              return Text(shoppingSheet?.title ?? '');
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.reorder),
              onPressed: () => ShoppingItemsReorderModalRoute(
                shoppingSheetId: shoppingSheetId,
              ).go(context),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => ShoppingSheetEditRoute(
                shoppingSheetId: shoppingSheetId,
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
                final hasAnyCompletedShoppingItemAsyncValue = ref.watch(
                  isAnyCompletedShoppingItemExistsStreamProvider(
                    shoppingSheetId,
                  ),
                );
                final isShowing =
                    !hasAnyCompletedShoppingItemAsyncValue.isLoading &&
                        hasAnyCompletedShoppingItemAsyncValue.hasValue &&
                        hasAnyCompletedShoppingItemAsyncValue.value!;
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
                shoppingItemsStreamProvider(shoppingSheetId),
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

                  return ImplicitlyAnimatedList(
                    items: shoppingItems,
                    areItemsTheSame: (oldItem, newItem) =>
                        oldItem.id == newItem.id,
                    itemBuilder: (context, animation, shoppingItem, index) {
                      Future<void> updateIsCompleted(bool newValue) async {
                        unawaited(HapticFeedback.selectionClick());
                        await ref
                            .read(shoppingItemsListControllerProvider.notifier)
                            .updateShoppingItemIsCompleted(
                              shoppingSheetId: shoppingSheetId,
                              shoppingItemId: shoppingItem.id!,
                              isCompleted: newValue,
                            );
                      }

                      Future<void> deleteShoppingItem() async {
                        final isConfirmed =
                            await DeleteShoppingItemConfirmDialog.show(
                          context,
                          shoppingItem: shoppingItem,
                        );
                        if (!isConfirmed) {
                          return;
                        }
                        return ref
                            .read(shoppingItemsListControllerProvider.notifier)
                            .deleteShoppingItem(
                              shoppingSheetId,
                              shoppingItem.id!,
                            );
                      }

                      return SizeFadeTransition(
                        curve: Curves.fastOutSlowIn,
                        animation: animation,
                        child: AppDismissible(
                          key: ValueKey(shoppingItem.id),
                          onDismiss: deleteShoppingItem,
                          child: ShoppingItemListTile(
                            shoppingItem: shoppingItem,
                            onPurchasedChanged: updateIsCompleted,
                            onTap: () => showShoppingItemForm(shoppingItem),
                          ),
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
