import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:kaimono_list/src/features/home/presentation/home_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/data/shopping_list_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_items_reorder/shopping_items_reorder_modal_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list/shopping_list_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_form/shopping_list_add/shopping_list_add_screen.dart';
import 'package:kaimono_list/src/features/shopping_list/presentation/shopping_list_form/shopping_list_edit/shopping_list_edit_screen.dart';
import 'package:kaimono_list/src/routing/app_router_ref_scope.dart';
import 'package:kaimono_list/src/routing/build_fade_transition_page.dart';

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

  /// Redirects the user based on their authentication status.
  ///
  /// If the user is signed in, they are redirected to the `from` location if it
  /// exists, otherwise to the home route. If the user is not signed in, no
  /// redirection occurs.
  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final signedIn = AppRouterRefScope.refOf(context)
        .read(authRepositoryProvider)
        .isSignedIn;

    if (signedIn) {
      return from != null
          ? Uri.decodeComponent(from!)
          : const HomeRoute().location;
    }

    return null;
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ShoppingListRoute>(
      path: 'shopping-list/:shoppingListId',
      routes: [
        TypedGoRoute<ShoppingListEditRoute>(
          path: 'edit',
        ),
        TypedGoRoute<ShoppingItemsReorderModalRoute>(
          path: 'reorder',
        ),
      ],
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

  /// Redirects the user based on their access permissions to a shopping list.
  ///
  /// This method checks if the user has access to a specific shopping list by
  /// querying the `shoppingListRepositoryProvider`. If the user has access,
  /// the method returns `null`, allowing the user to proceed. If the user does
  /// not have access, the method returns the location of the `HomeRoute`.
  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final canAccess = await AppRouterRefScope.refOf(context)
        .read(shoppingListRepositoryProvider)
        .canAccess(shoppingListId);
    return canAccess ? null : const HomeRoute().location;
  }
}

class ShoppingListEditRoute extends GoRouteData {
  const ShoppingListEditRoute({
    required this.shoppingListId,
  });

  final String shoppingListId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShoppingListEditScreen(
      shoppingListId: shoppingListId,
    );
  }
}

class ShoppingListAddRoute extends GoRouteData {
  const ShoppingListAddRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShoppingListAddScreen();
  }
}

class ShoppingItemsReorderModalRoute extends GoRouteData {
  const ShoppingItemsReorderModalRoute({
    required this.shoppingListId,
  });

  final String shoppingListId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildFadeTransitionPage(
      context: context,
      state: state,
      fullscreenDialog: true,
      child: ShoppingItemsReorderModalScreen(
        shoppingListId: shoppingListId,
      ),
    );
  }
}
