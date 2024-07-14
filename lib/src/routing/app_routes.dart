import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/item/presentation/item_list/item_list_screen.dart';

part 'app_routes.g.dart';

mixin AppRoute {
  static const String itemList = 'itemList';
}

@TypedGoRoute<ItemListRoute>(
  path: '/',
  name: AppRoute.itemList,
)
class ItemListRoute extends GoRouteData {
  const ItemListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ItemListScreen();
  }
}
