import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AppDismissible extends StatelessWidget {
  const AppDismissible({
    required super.key,
    required this.onDismiss,
    required this.child,
  });

  final VoidCallback onDismiss;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: super.key,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          OutlinedButtonTheme(
            data: const OutlinedButtonThemeData(
              style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
            child: SlidableAction(
              onPressed: (_) => onDismiss(),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
