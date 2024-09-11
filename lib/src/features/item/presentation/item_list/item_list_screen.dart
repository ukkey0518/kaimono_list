import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/progress_indicator.dart';
import 'package:kaimono_list/src/constants/app_sizes.dart';
import 'package:kaimono_list/src/features/item/data/item_repository.dart';
import 'package:kaimono_list/src/features/item/domain/item.dart';
import 'package:kaimono_list/src/features/item/presentation/item_list/item_delete_confirm_dialog.dart';
import 'package:kaimono_list/src/features/item/presentation/item_list/item_list_controller.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/global_key_extensions.dart';

class ItemListScreen extends HookConsumerWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isReorderMode = useState(false);

    ref.listen(
      itemListControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> addNewItem() async {
      final newItemName = await showDialog<String>(
        context: context,
        builder: (_) => const _ItemNameEditDialog(),
      );
      if (newItemName == null) {
        return;
      }
      await ref.read(itemListControllerProvider.notifier).addItem(newItemName);
    }

    Future<void> deleteAllPurchasedItems() async {
      final isConfirmed = await ItemDeleteConfirmDialog.show(context);
      if (!isConfirmed) {
        return;
      }
      await ref
          .read(itemListControllerProvider.notifier)
          .deleteAllPurchasedItems();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('かいものリスト'),
        actions: [
          IconButton(
            icon: Icon(isReorderMode.value ? Icons.done : Icons.reorder),
            onPressed: () => isReorderMode.value = !isReorderMode.value,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: deleteAllPurchasedItems,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewItem,
        child: const Icon(Icons.add),
      ),
      body: ItemListView(
        isReorderMode: isReorderMode.value,
        onReorder: (newItems) => ref
            .read(itemListControllerProvider.notifier)
            .updateOrderIndexes(newItems),
      ),
    );
  }
}

class ItemListView extends HookConsumerWidget {
  const ItemListView({
    required this.isReorderMode,
    required this.onReorder,
    super.key,
  });

  final bool isReorderMode;
  final ValueChanged<List<Item>> onReorder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsyncValue = ref.watch(itemsListStreamProvider);

    if (itemsAsyncValue.isLoading) {
      return const Center(
        child: AppLoadingIndicator(),
      );
    }

    Future<void> editItemName(Item item) async {
      final newName = await showDialog<String>(
        context: context,
        builder: (_) => _ItemNameEditDialog(initialName: item.name),
      );
      if (newName == null) {
        return;
      }
      await ref
          .read(itemListControllerProvider.notifier)
          .updateItem(item.copyWith(name: newName));
    }

    Future<void> togglePurchased(Item item) async {
      await ref
          .read(itemListControllerProvider.notifier)
          .updateItem(item.copyWith(isPurchased: !item.isPurchased));
    }

    final items = itemsAsyncValue.value ?? [];

    return ReorderableListView.builder(
      itemCount: items.length,
      buildDefaultDragHandles: false,
      padding: const EdgeInsets.only(bottom: Sizes.p64 * 2),
      onReorder: (oldIndex, newIndex) {
        final newItems = items.toList();
        // newIndex の調整
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = newItems.removeAt(oldIndex);
        newItems.insert(newIndex, item);
        onReorder(newItems);
      },
      itemBuilder: (_, index) {
        final item = items[index];
        return ListTile(
          key: ValueKey(item.id),
          leading: SizedBox(
            width: Sizes.p48,
            child: Checkbox(
              value: item.isPurchased,
              onChanged: (_) => togglePurchased(item),
            ),
          ),
          title: SizedBox(
            height: kMinInteractiveDimension,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    style: item.isPurchased
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: Sizes.p8),
                if (isReorderMode)
                  ReorderableDragStartListener(
                    index: index,
                    child: const SizedBox.square(
                      dimension: kMinInteractiveDimension,
                      child: Icon(
                        Icons.drag_handle,
                        color: Colors.grey,
                      ),
                    ),
                  )
                else
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    onPressed: () => editItemName(item),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ItemNameEditDialog extends HookWidget {
  const _ItemNameEditDialog({
    this.initialName,
  });

  final String? initialName;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final controller = useTextEditingController(text: initialName);

    Future<void> submit() async {
      if (!(await formKey.validateAndScrollToInvalidField())) {
        return;
      }
      if (!context.mounted) {
        return;
      }
      context.pop(controller.text.trim());
    }

    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text('アイテムを編集'),
        content: TextFormField(
          controller: controller,
          validator: FormBuilderValidators.required(errorText: '未入力だで'),
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'アイテム名',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: context.pop,
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: submit,
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
