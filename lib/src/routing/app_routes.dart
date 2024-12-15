import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:kaimono_list/src/features/shopping_sheet/data/shopping_sheet_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/reorder_shopping_items_screen.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet/shopping_items_list_screen.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet_edit/shopping_sheet_edit_screen.dart';
import 'package:kaimono_list/src/features/shopping_sheet/presentation/shopping_sheet_list/shopping_sheet_list_screen.dart';
import 'package:kaimono_list/src/routing/app_router_ref_scope.dart';
import 'package:kaimono_list/src/routing/build_fade_transition_page.dart';
import 'package:kaimono_list/src/routing/initial_location_controller.dart';

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
    TypedGoRoute<ShoppingSheetRoute>(
      path: 'shopping-list/:shoppingSheetId',
      routes: [
        TypedGoRoute<ShoppingSheetEditRoute>(
          path: 'edit',
        ),
        TypedGoRoute<ShoppingItemsReorderModalRoute>(
          path: 'reorder',
        ),
      ],
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShoppingSheetListScreen();
  }
}

class ShoppingSheetRoute extends GoRouteData {
  const ShoppingSheetRoute({
    required this.shoppingSheetId,
  });

  final String shoppingSheetId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    /// Sets the initial location using the `initialLocationControllerProvider`
    /// notifier. This operation is performed without awaiting its completion.
    unawaited(
      AppRouterRefScope.refOf(context)
          .read(initialLocationControllerProvider.notifier)
          .setInitialLocation(location),
    );

    return ShoppingItemsListScreen(shoppingSheetId: shoppingSheetId);
  }

  /// Redirects the user based on their access permissions to a shopping list.
  ///
  /// This method checks if the user has access to a specific shopping list by
  /// querying the `shoppingSheetRepositoryProvider`. If the user has access,
  /// the method returns `null`, allowing the user to proceed. If the user does
  /// not have access, the method returns the location of the `HomeRoute`.
  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final canAccess = await AppRouterRefScope.refOf(context)
        .read(shoppingSheetRepositoryProvider)
        .canAccess(shoppingSheetId);
    return canAccess ? null : const HomeRoute().location;
  }
}

class ShoppingSheetEditRoute extends GoRouteData {
  const ShoppingSheetEditRoute({
    required this.shoppingSheetId,
  });

  final String shoppingSheetId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShoppingSheetEditScreen(
      shoppingSheetId: shoppingSheetId,
    );
  }
}

class ShoppingItemsReorderModalRoute extends GoRouteData {
  const ShoppingItemsReorderModalRoute({
    required this.shoppingSheetId,
  });

  final String shoppingSheetId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildFadeTransitionPage(
      context: context,
      state: state,
      fullscreenDialog: true,
      child: ReorderShoppingItemsScreen(
        shoppingSheetId: shoppingSheetId,
      ),
    );
  }
}
