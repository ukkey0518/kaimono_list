import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:kaimono_list/src/features/home/presentation/home_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/add_shopping_list/add_shopping_list_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/shopping_list_screen.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SignInRoute>(
  path: '/sign-in',
)
class SignInRoute extends GoRouteData {
  const SignInRoute({
    this.from,
  });

  final String? from;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EmailPasswordSignInScreen();
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ShoppingListRoute>(
      path: 'shopping-list/:shoppingListId',
    ),
    TypedGoRoute<ShoppingListAddRoute>(
      path: 'shopping-list-add',
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class ShoppingListRoute extends GoRouteData {
  const ShoppingListRoute({
    required this.shoppingListId,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShoppingListScreen(
      shoppingListId: shoppingListId,
    );
  }
}

class ShoppingListAddRoute extends GoRouteData {
  const ShoppingListAddRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddShoppingListScreen();
  }
}
