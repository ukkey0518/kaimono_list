import 'package:flutter/material.dart';
import 'package:kaimono_list/src/common_widgets/dialogs.dart';
import 'package:kaimono_list/src/utils/snackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension AsyncValueUI<T> on AsyncValue<T> {
  void handleError(
    void Function(Object error, StackTrace? stackTrace) onError,
  ) {
    switch (this) {
      case AsyncError(:final error, :final stackTrace):
        onError(error, stackTrace);
    }
  }

  void showDialogOnError(BuildContext context) {
    switch (this) {
      case AsyncError(:final error):
        if (context.mounted) {
          AppErrorDialog.show(context, error);
        }
    }
  }

  void showSnackbarOnError(BuildContext context) {
    switch (this) {
      case AsyncError(:final error):
        if (context.mounted) {
          AppSnackbar.showError(context, error);
        }
    }
  }
}
