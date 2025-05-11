import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignOutIconButton extends ConsumerWidget {
  const SignOutIconButton({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.exit_to_app),
      onPressed: onPressed,
    );
  }
}
