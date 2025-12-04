import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';

class ShoppingItemFormBottomSheet extends HookWidget {
  const ShoppingItemFormBottomSheet._({
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
      builder: (context) => ShoppingItemFormBottomSheet._(
        key: key,
        shoppingItem: shoppingItem,
      ),
    );
  }

  final ShoppingItem? shoppingItem;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: shoppingItem?.name);

    void submit() {
      unawaited(HapticFeedback.mediumImpact());
      final newShoppingItem =
          shoppingItem?.copyWith(name: nameController.text) ??
          ShoppingItem(name: nameController.text);
      context.pop(newShoppingItem);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Sizes.p24,
        Sizes.p16,
        Sizes.p24,
        Sizes.p32,
      ).add(EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListenableBuilder(
                listenable: nameController,
                builder: (context, _) {
                  final isEmpty = nameController.text.trim().isEmpty;
                  return ElevatedButton(
                    onPressed: isEmpty ? context.pop : submit,
                    child: isEmpty
                        ? const Icon(Icons.close)
                        : const Icon(Icons.check),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: nameController,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'アイテム名',
            ),
          ),
        ],
      ),
    );
  }
}
