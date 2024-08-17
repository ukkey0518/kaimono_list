import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/constants/sizes.dart';

final class AppSnackbar {
  const AppSnackbar._();

  /// Shows an info snackbar with the provided [message].
  static Future<void> showMessage(
    BuildContext context,
    String message,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
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
        backgroundColor: Colors.lightBlue,
        content: Row(
          children: [
            Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const Gap(Sizes.p8),
            Flexible(
              child: Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
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
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Row(
          children: [
            Icon(
              Icons.cancel,
              color: Theme.of(context).colorScheme.onError,
            ),
            const Gap(Sizes.p8),
            Flexible(
              child: Text(
                '$error',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
