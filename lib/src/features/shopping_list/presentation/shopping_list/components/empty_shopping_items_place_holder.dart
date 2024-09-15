import 'package:flutter/material.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class EmptyShoppingItemPlaceHolder extends StatelessWidget {
  const EmptyShoppingItemPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Commonization PlaceHolder widget.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.insert_emoticon_outlined,
          size: 100,
          color: Colors.grey,
        ),
        const SizedBox(height: 16),
        Text(
          'No shopping items yet'.hardcoded,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
