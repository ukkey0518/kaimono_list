import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_lists_screen.dart';

part 'app_routes.g.dart';

@TypedGoRoute<ShoppingListsRoute>(
  path: '/',
)
class ShoppingListsRoute extends GoRouteData {
  const ShoppingListsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShoppingListsScreen();
  }
}

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
