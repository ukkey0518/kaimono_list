import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page<T> buildFadeTransitionPage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool fullscreenDialog = false,
  Color? barrierColor,
  bool barrierDismissible = true,
  Duration transitionDuration = const Duration(milliseconds: 300),
  Duration reverseTransitionDuration = const Duration(milliseconds: 300),
}) {
  return CustomTransitionPage<T>(
    fullscreenDialog: fullscreenDialog,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    transitionDuration: transitionDuration,
    reverseTransitionDuration: reverseTransitionDuration,
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    child: child,
  );
}
