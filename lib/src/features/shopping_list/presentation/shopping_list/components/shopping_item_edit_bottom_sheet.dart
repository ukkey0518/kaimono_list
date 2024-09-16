import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';

class ShoppingItemEditBottomSheet extends HookWidget {
  const ShoppingItemEditBottomSheet._({
    required super.key,
    required this.shoppingItem,
  });

  static Future<ShoppingItem?> show(
    BuildContext context, {
    Key? key,
    ShoppingItem? shoppingItem,
  }) {
    return showModalBottomSheet<ShoppingItem>(
      context: context,
      barrierColor: Colors.transparent,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => ShoppingItemEditBottomSheet._(
        key: key,
        shoppingItem: shoppingItem,
      ),
    );
  }

  final ShoppingItem? shoppingItem;

  @override
  Widget build(BuildContext context) {
    final isEditing = shoppingItem != null;

    final nameController = useTextEditingController(
      text: shoppingItem?.name,
    );

    void submit() {
      final newShoppingItem = shoppingItem?.copyWith(
            name: nameController.text,
          ) ??
          ShoppingItem(
            name: nameController.text,
          );
      context.pop(newShoppingItem);
    }

    return Padding(
      padding: const EdgeInsets.all(Sizes.p24).add(
        EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'アイテム名',
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ListenableBuilder(
              listenable: nameController,
              builder: (context, _) {
                final isEmpty = nameController.text.trim().isEmpty;
                return ElevatedButton(
                  onPressed: isEmpty ? context.pop : submit,
                  child: Text(
                    isEmpty
                        ? '閉じる'
                        : isEditing
                            ? '更新'
                            : '追加',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
