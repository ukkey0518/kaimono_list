import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:kaimono_list/src/features/item/presentation/item_list/item_list_screen.dart';

part 'app_routes.g.dart';

@TypedGoRoute<ItemListRoute>(
  path: '/',
)
class ItemListRoute extends GoRouteData {
  const ItemListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ItemListScreen();
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
