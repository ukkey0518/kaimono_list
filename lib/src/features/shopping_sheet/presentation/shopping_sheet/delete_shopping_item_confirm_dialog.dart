import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_item.dart';

class DeleteShoppingItemConfirmDialog extends StatelessWidget {
  const DeleteShoppingItemConfirmDialog._({
    required this.shoppingItem,
    super.key,
  });

  static Future<bool> show(
    BuildContext context, {
    required ShoppingItem shoppingItem,
    Key? key,
  }) async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) => DeleteShoppingItemConfirmDialog._(
        shoppingItem: shoppingItem,
        key: key,
      ),
    );
    return isConfirmed ?? false;
  }

  final ShoppingItem shoppingItem;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('買い物アイテムの削除'),
      content: Text('「${shoppingItem.name}」を削除しますか？'),
      actions: [
        ElevatedButton(
          onPressed: context.pop,
          child: const Text('キャンセル'),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          child: const Text('削除'),
        ),
      ],
    );
  }
}
