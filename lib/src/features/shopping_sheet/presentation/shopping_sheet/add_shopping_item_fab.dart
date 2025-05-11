import 'package:flutter/material.dart';

class AddShoppingItemFab extends StatelessWidget {
  const AddShoppingItemFab({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: 'addShoppingItem',
      // TODO(Ukkey): Add elevation to the theme
      elevation: 4,
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      label: const Text('買うもの追加'),
    );
  }
}
