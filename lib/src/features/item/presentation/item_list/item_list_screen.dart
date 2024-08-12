import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';
import 'package:kaimono_list/src/common_widgets/progress_indicator.dart';
import 'package:kaimono_list/src/constants/app_sizes.dart';
import 'package:kaimono_list/src/features/item/data/item_repository.dart';
import 'package:kaimono_list/src/features/item/domain/item.dart';
import 'package:kaimono_list/src/features/item/presentation/item_list/item_delete_confirm_dialog.dart';
import 'package:kaimono_list/src/features/item/presentation/item_list/item_list_controller.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';
import 'package:kaimono_list/src/utils/un_focus_all.dart';

class ItemListScreen extends HookConsumerWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      itemListControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> deleteAllPurchasedItems() async {
      final isConfirmed = await ItemDeleteConfirmDialog.show(context);
      if (!isConfirmed) {
        return;
      }
      await ref
          .read(itemListControllerProvider.notifier)
          .deleteAllPurchasedItems();
    }

    return GestureDetector(
      onTap: unFocusAll,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('かいものリスト'),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: deleteAllPurchasedItems,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ItemListView(
                onAddItem: (itemName) => ref
                    .read(itemListControllerProvider.notifier)
                    .addItem(itemName),
                onUpdateItem: (item) => ref
                    .read(itemListControllerProvider.notifier)
                    .updateItem(item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListView extends ConsumerWidget {
  const ItemListView({
    required this.onAddItem,
    required this.onUpdateItem,
    super.key,
  });

  final ValueChanged<String> onAddItem;
  final ValueChanged<Item> onUpdateItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsyncValue = ref.watch(itemsListStreamProvider);

    if (itemsAsyncValue.isLoading) {
      return const Center(
        child: AppLoadingIndicator(),
      );
    }

    final items = itemsAsyncValue.value ?? [];

    return ListView(
      children: <Widget>[
        for (final item in items)
          ItemListTile(
            item: item,
            onToggle: () => onUpdateItem(
              item.copyWith(
                isPurchased: !item.isPurchased,
              ),
            ),
            onSubmitted: (name) => onUpdateItem(
              item.copyWith(
                name: name,
              ),
            ),
          ),
        ItemAddTile(
          onSubmitted: onAddItem,
        ),
      ]
          .intersperse(
            const Divider(
              height: 1,
            ),
          )
          .toList(),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    required this.leading,
    required this.controller,
    required this.onSubmitted,
    super.key,
    this.focusNode,
    this.hintText,
  });

  final Widget leading;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String> onSubmitted;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: Sizes.p48,
        child: leading,
      ),
      title: TextField(
        controller: controller,
        focusNode: focusNode,
        onSubmitted: (_) {
          onSubmitted.call(controller.text);
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class ItemListTile extends HookWidget {
  const ItemListTile({
    required this.item,
    required this.onToggle,
    required this.onSubmitted,
    super.key,
  });

  final Item item;
  final VoidCallback onToggle;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(
      text: item.name,
    );
    final focusNode = useFocusNode();

    useEffect(
      () {
        controller.text = item.name;
        return null;
      },
      [item.name],
    );

    return ItemTile(
      leading: Checkbox(
        value: item.isPurchased,
        onChanged: (_) => onToggle(),
      ),
      controller: controller,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
    );
  }
}

class ItemAddTile extends HookWidget {
  const ItemAddTile({
    required this.onSubmitted,
    super.key,
  });

  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    return ItemTile(
      leading: const Icon(Icons.add),
      controller: controller,
      focusNode: focusNode,
      hintText: 'かうもの'.hardcoded,
      onSubmitted: (name) {
        onSubmitted.call(name);
        controller.clear();
        focusNode.requestFocus();
      },
    );
  }
}
