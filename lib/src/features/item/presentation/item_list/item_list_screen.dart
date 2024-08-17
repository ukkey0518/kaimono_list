import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/progress_indicator.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
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
    final addTileKey = useMemoized(GlobalKey.new);
    final scrollController = useScrollController();

    ref.listen(
      itemListControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    Future<void> addNewItem(String name) async {
      await ref.read(itemListControllerProvider.notifier).addItem(name);
      await scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ItemListView(
                  scrollController: scrollController,
                  onUpdateItem: (item) => ref
                      .read(itemListControllerProvider.notifier)
                      .updateItem(item),
                  onDeleteItem:
                      ref.read(itemListControllerProvider.notifier).deleteItem,
                ),
              ),
              const Divider(height: 1),
              ItemAddTile(
                key: addTileKey,
                onSubmitted: addNewItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemListView extends HookConsumerWidget {
  const ItemListView({
    required this.scrollController,
    required this.onUpdateItem,
    required this.onDeleteItem,
    super.key,
  });

  final ScrollController scrollController;
  final ValueChanged<Item> onUpdateItem;
  final ValueChanged<String> onDeleteItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsyncValue = ref.watch(itemsListStreamProvider);

    if (itemsAsyncValue.isLoading) {
      return const Center(
        child: AppLoadingIndicator(),
      );
    }

    final items = itemsAsyncValue.value ?? [];

    return ListView.separated(
      controller: scrollController,
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
      ),
      itemBuilder: (_, index) {
        final item = items[index];
        return ItemListTile(
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
          onDismissed: () => onDeleteItem(item.id!),
        );
      },
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    required this.leading,
    required this.child,
    super.key,
  });

  final Widget leading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: Sizes.p48,
        child: leading,
      ),
      title: SizedBox(
        height: kMinInteractiveDimension,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
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
    required this.onDismissed,
    super.key,
  });

  final Item item;
  final VoidCallback onToggle;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final isEditing = useState(false);
    final focusNode = useFocusNode();
    final controller = useTextEditingController(
      text: item.name,
    );

    useEffect(
      () {
        controller.text = item.name;
        return null;
      },
      [item.name],
    );

    useEffect(
      () {
        void listener() {
          if (!focusNode.hasFocus) {
            controller.text = item.name;
            isEditing.value = false;
          }
        }

        focusNode.addListener(listener);
        return () => focusNode.removeListener(listener);
      },
      [],
    );

    final text = GestureDetector(
      onLongPress: () => isEditing.value = true,
      behavior: HitTestBehavior.translucent,
      child: Text(
        controller.text,
        style: item.isPurchased
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
              )
            : null,
      ),
    );

    final textField = TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      autofocus: true,
      enabled: isEditing.value,
      onSubmitted: (name) {
        if (name.isEmpty) {
          controller.text = item.name;
          return;
        }
        onSubmitted(name);
      },
    );

    return Dismissible(
      key: ValueKey(item.id),
      onDismissed: (_) => onDismissed(),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: Sizes.p16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      behavior: HitTestBehavior.translucent,
      child: ItemTile(
        leading: Checkbox(
          value: item.isPurchased,
          onChanged: (_) => onToggle(),
        ),
        child: isEditing.value ? textField : text,
      ),
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
    final focusNode = useFocusNode();
    final controller = useTextEditingController();

    return ItemTile(
      leading: const Icon(Icons.add),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onSubmitted: (name) {
          if (name.isNotEmpty) {
            onSubmitted.call(name);
            controller.clear();
            focusNode.requestFocus();
          }
        },
        decoration: InputDecoration(
          hintText: 'かうもの'.hardcoded,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
