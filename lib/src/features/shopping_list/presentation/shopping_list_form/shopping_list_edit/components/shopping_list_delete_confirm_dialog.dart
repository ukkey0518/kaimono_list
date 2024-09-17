import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ShoppingListDeleteConfirmDialog extends StatelessWidget {
  const ShoppingListDeleteConfirmDialog._({super.key});

  static Future<bool> show(
    BuildContext context, {
    Key? key,
  }) async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return ShoppingListDeleteConfirmDialog._(key: key);
      },
    );
    return isConfirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('買い物リストの削除'.hardcoded),
      content: Text('本当に削除しますか？'.hardcoded),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text('キャンセル'.hardcoded),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onError,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () => context.pop(true),
          child: Text('削除する'.hardcoded),
        ),
      ],
    );
  }
}
