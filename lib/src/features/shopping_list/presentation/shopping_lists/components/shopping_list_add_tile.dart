import 'package:flutter/material.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ShoppingListAddTile extends StatelessWidget {
  const ShoppingListAddTile({
    required this.onTap,
    super.key,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.add),
      title: Text('新しいリストを追加'.hardcoded),
      onTap: onTap,
    );
  }
}
