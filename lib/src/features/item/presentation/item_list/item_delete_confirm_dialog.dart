import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDeleteConfirmDialog extends StatelessWidget {
  const ItemDeleteConfirmDialog._({
    super.key,
  });

  static Future<bool> show(
    BuildContext context, {
    Key? key,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => ItemDeleteConfirmDialog._(
        key: key,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('購入済アイテムの削除'),
      content: const Text(
        '購入済アイテムを全て削除しますか？\n'
        'この操作は取り消せません。',
      ),
      actions: [
        TextButton(
          onPressed: () => GoRouter.of(context).pop(false),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () => GoRouter.of(context).pop(true),
          child: const Text('削除する'),
        ),
      ],
    );
  }
}
