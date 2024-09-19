import 'package:flutter/material.dart';
import 'package:kaimono_list/src/constants/sizes.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/user_shopping_list.dart';

class UserShoppingListTile extends StatelessWidget {
  const UserShoppingListTile({
    required this.userShoppingList,
    required this.onTap,
    super.key,
  });

  final UserShoppingList userShoppingList;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.list_alt),
      title: Row(
        children: [
          Expanded(
            child: Text(userShoppingList.name ?? '??'),
          ),
          // TODO(Ukkey): Show the number of items in the shopping list
          const Padding(
            padding: EdgeInsets.only(right: Sizes.p8),
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
