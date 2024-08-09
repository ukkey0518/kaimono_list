import 'package:flutter/material.dart';
import 'package:kaimono_list/src/common_widgets/dialogs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension AsyncValueUI<T> on AsyncValue<T> {
  void showDialogOnError(BuildContext context) {
    switch (this) {
      case AsyncError(:final error):
        if (context.mounted) {
          ErrorDialog.show(context, error);
        }
    }
  }
}
