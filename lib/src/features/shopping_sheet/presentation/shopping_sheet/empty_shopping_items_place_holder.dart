import 'package:flutter/material.dart';
import 'package:kaimono_list/src/common_widgets/big_icon_with_label.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class EmptyShoppingItemsPlaceHolder extends StatelessWidget {
  const EmptyShoppingItemsPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return BigIconWithLabel(
      icon: const Icon(
        Icons.insert_emoticon_outlined,
        color: Colors.grey,
      ),
      label: Text(
        'No shopping items yet'.hardcoded,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
