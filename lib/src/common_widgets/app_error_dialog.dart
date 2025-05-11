import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class AppErrorDialog extends StatelessWidget {
  const AppErrorDialog._({required this.error});

  static Future<void> show(BuildContext context, dynamic error) {
    return showDialog<void>(
      context: context,
      builder: (context) => AppErrorDialog._(error: error),
    );
  }

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, color: Theme.of(context).colorScheme.error),
          const Gap(Sizes.p8),
          Text(
            'Error'.hardcoded,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
      content: Text(error.toString()),
      actions: [
        TextButton(
          onPressed: GoRouter.of(context).pop,
          child: Text('閉じる'.hardcoded),
        ),
      ],
    );
  }
}
