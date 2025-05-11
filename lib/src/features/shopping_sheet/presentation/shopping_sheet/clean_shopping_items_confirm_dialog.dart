import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CleanShoppingItemsConfirmDialog extends StatelessWidget {
  const CleanShoppingItemsConfirmDialog._({super.key});

  static Future<bool> show(BuildContext context, {Key? key}) async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) => CleanShoppingItemsConfirmDialog._(key: key),
    );
    return isConfirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('購入済のアイテムを削除しますか？'),
      content: const Text('この操作は取り消せません。'),
      actions: [
        TextButton(onPressed: context.pop, child: const Text('キャンセル')),
        ElevatedButton(
          onPressed: () => context.pop(true),
          child: const Text('削除する'),
        ),
      ],
    );
  }
}
