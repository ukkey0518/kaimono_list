import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/dialogs.dart';
import 'package:kaimono_list/src/common_widgets/progress_widget.dart';
import 'package:kaimono_list/src/common_widgets/retry_button.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_item_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/reorder_shopping_items_controller.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/shopping_item_list_tile.dart';
import 'package:kaimono_list/src/utils/extensions/widget_ref_extensions.dart';
import 'package:kaimono_list/src/utils/snackbar.dart';

class ReorderShoppingItemsScreen extends HookConsumerWidget {
  const ReorderShoppingItemsScreen({
    required this.shoppingSheetId,
    super.key,
  });

  final String shoppingSheetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentValues = useState<List<ShoppingItem>>([]);

    final initialValuesAsyncValue = ref.watch(
      shoppingItemsFutureProvider(shoppingSheetId),
    );

    final initialValues = initialValuesAsyncValue.value ?? [];

    useEffect(
      () {
        currentValues.value = initialValues;
        return null;
      },
      initialValues,
    );

    ref
      ..listenAsyncError(
        shoppingItemsFutureProvider(shoppingSheetId),
        (e, _) => AppSnackbar.showError(context, e),
      )
      ..listenAsyncError(
        reorderShoppingItemsControllerProvider,
        (e, _) => AppErrorDialog.show(context, e),
      );

    Future<void> submit() async {
      await ref
          .read(reorderShoppingItemsControllerProvider.notifier)
          .reorderShoppingItems(
            shoppingSheetId: shoppingSheetId,
            sortedShoppingItemIds:
                currentValues.value.map((e) => e.id!).toList(),
          );
      if (context.mounted) {
        context.pop();
      }
    }

    final isProcessing = initialValuesAsyncValue.isLoading;
    final hasError = initialValuesAsyncValue.hasError;

    return Scaffold(
      appBar: AppBar(
        title: const Text('買い物アイテムの並び替え'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: !isProcessing && !hasError ? submit : null,
          ),
        ],
      ),
      body: ProgressWidget(
        isLoading: isProcessing,
        child: hasError
            ? RetryButton(
                onPressed: () =>
                    ref.refresh(shoppingItemsFutureProvider(shoppingSheetId)),
              )
            : ImplicitlyAnimatedReorderableList(
                items: currentValues.value,
                areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
                onReorderFinished: (item, from, to, newItems) {
                  currentValues.value = newItems;
                },
                itemBuilder: (context, animation, shoppingItem, index) {
                  return Reorderable(
                    key: ValueKey(shoppingItem.id),
                    child: SizeFadeTransition(
                      animation: animation,
                      curve: Curves.fastOutSlowIn,
                      child: ShoppingItemListTile(
                        shoppingItem: shoppingItem,
                        trailing: const Handle(
                          delay: Duration(milliseconds: 100),
                          child: Icon(
                            Icons.drag_handle,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
