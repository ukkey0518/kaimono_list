import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/constants/app_sizes.dart';

final class AppSnackbar {
  const AppSnackbar._();

  /// Shows an info snackbar with the provided [message].
  static Future<void> showInfo(
    BuildContext context,
    String message,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const Gap(Sizes.p8),
            Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows a success snackbar with the provided [message].
  static Future<void> showSuccess(
    BuildContext context,
    String message,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const Gap(Sizes.p8),
            Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows an error snackbar with the provided [error].
  static Future<void> showError(
    BuildContext context,
    dynamic error,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.onError,
            ),
            const Gap(Sizes.p8),
            Text(
              '$error',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
