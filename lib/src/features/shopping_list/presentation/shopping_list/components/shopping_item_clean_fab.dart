import 'package:flutter/material.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ShoppingItemCleanFab extends StatelessWidget {
  const ShoppingItemCleanFab({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '購入済のアイテムを削除'.hardcoded,
      // * Adjust verticalOffset to show Tooltip above the Widget
      verticalOffset: -Sizes.p64,
      child: FloatingActionButton.small(
        heroTag: 'cleanShoppingItems',
        // TODO(Ukkey): Add elevation to the theme
        elevation: 4,
        onPressed: onPressed,
        child: const Icon(Icons.cleaning_services_rounded),
      ),
    );
  }
}
