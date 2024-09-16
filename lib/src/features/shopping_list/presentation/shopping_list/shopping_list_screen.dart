import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/exceptions/permission_denied_exception.dart';
import 'package:kaimono_list/src/features/error/presentation/error_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_add_fab.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_clean_fab.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_edit_bottom_sheet.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/components/shopping_item_list_view.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/shopping_list_controller.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/utils/app_logger.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ShoppingListScreen extends HookConsumerWidget {
  const ShoppingListScreen({
    required this.shoppingListId,
    super.key,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      shoppingListControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> showShoppingItemForm([ShoppingItem? shoppingItem]) async {
      final controller = ref.read(
        shoppingListControllerProvider.notifier,
      );
      final newShoppingItem = await ShoppingItemEditBottomSheet.show(
        context,
        shoppingItem: shoppingItem,
      );
      if (newShoppingItem == null) {
        return;
      }

      if (shoppingItem == null) {
        await controller.createNewShoppingItem(
          shoppingListId: shoppingListId,
          name: newShoppingItem.name,
        );
      } else {
        await controller.updateShoppingItemInfo(
          shoppingListId: shoppingListId,
          shoppingItemId: shoppingItem.id!,
          name: newShoppingItem.name,
        );
      }
    }

    return Consumer(
      builder: (context, ref, child) {
        final shoppingListAsyncValue = ref.watch(
          shoppingListFutureProvider(shoppingListId),
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

        return GestureDetector(
          onTap: unFocusAll,
          child: Scaffold(
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
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final hasAnyPurchasedShoppingItem = ref.watch(
                      hasAnyPurchasedShoppingItemStreamProvider(shoppingListId),
                    );
                    if (hasAnyPurchasedShoppingItem.hasError) {
                      AppLogger().captureException(
                        hasAnyPurchasedShoppingItem.error,
                        hasAnyPurchasedShoppingItem.stackTrace,
                      );
                    }
                    final isShowing = !hasAnyPurchasedShoppingItem.isLoading &&
                        hasAnyPurchasedShoppingItem.hasValue &&
                        hasAnyPurchasedShoppingItem.value!;
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isShowing ? 1 : 0,
                      child: IgnorePointer(
                        ignoring: !isShowing,
                        child: ShoppingItemCleanFab(
                          onPressed: () => ref
                              .read(shoppingListControllerProvider.notifier)
                              .deleteAllPurchasedShoppingItems(
                                shoppingListId,
                              ),
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
            body: ShoppingItemListView(
              shoppingListId: shoppingListId,
              onEditShoppingItem: showShoppingItemForm,
            ),
          ),
        );
      },
    );
  }
}
