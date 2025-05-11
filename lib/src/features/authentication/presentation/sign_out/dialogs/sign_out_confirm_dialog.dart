import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class SignOutConfirmDialog extends StatelessWidget {
  const SignOutConfirmDialog._({super.key});

  static Future<bool> show(BuildContext context, {Key? key}) async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) => SignOutConfirmDialog._(key: key),
    );
    return isConfirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sign Out'.hardcoded),
      content: Text('ログアウトしますか？'.hardcoded),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text('キャンセル'.hardcoded),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text('ログアウト'.hardcoded),
        ),
      ],
    );
  }
}
