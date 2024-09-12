import 'package:flutter/material.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class EmptyShoppingListPlaceholder extends StatelessWidget {
  const EmptyShoppingListPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Commonization PlaceHolder widget.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.shopping_cart_outlined,
          // TODO(Ukkey): Define a constant for the size
          size: 100,
          color: Colors.grey,
        ),
        const SizedBox(height: 16),
        Text(
          'No shopping lists yet'.hardcoded,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
