import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
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
      title: Row(
        children: [
          const Icon(Icons.add),
          const Gap(Sizes.p8),
          Text('新しいリストを追加'.hardcoded),
        ],
      ),
      onTap: onTap,
    );
  }
}
