import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh),
      label: const Text('Retry'),
    );
  }
}
