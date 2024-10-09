import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_item.dart';
import 'package:kaimono_list/src/utils/types/value_widget_builder.dart';

class ShoppingItemsListView extends ConsumerWidget {
  const ShoppingItemsListView.builder({
    required this.shoppingItems,
    required this.itemBuilder,
    this.controller,
    this.padding,
    this.shrinkWrap = false,
    super.key,
  });

  final List<ShoppingItem> shoppingItems;
  final AppValueWidgetBuilder<ShoppingItem> itemBuilder;

  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: shoppingItems.length,
      controller: controller,
      padding: padding,
      itemBuilder: (context, index) {
        final shoppingItem = shoppingItems[index];
        return itemBuilder(
          context,
          shoppingItem,
        );
      },
    );
  }
}
