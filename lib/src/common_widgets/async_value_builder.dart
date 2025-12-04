import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/common_widgets/retry_button.dart';

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    required this.asyncValue,
    required this.builder,
    required this.onRetry,
    super.key,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(BuildContext context, T value) builder;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError() => RetryButton(onPressed: onRetry),
      AsyncData(:final value) => builder(context, value),
    };
  }
}
