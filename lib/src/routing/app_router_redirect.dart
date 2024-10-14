import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/routing/app_router.dart';
import 'package:kaimono_list/src/routing/app_router_ref_scope.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';

/// Handles top-level redirects for the app.
/// This function is passed to the [GoRoute.redirect] property
/// returned by [appRouter].
Future<String?> appRouterRedirect(
  BuildContext context,
  GoRouterState state,
  AppRouterRef ref,
) async {
  final matchedLocation = state.matchedLocation;

  /// Set the [AppRouterRef] instance to the [AppRouterRefScope] widget
  AppRouterRefScope.maybeOf(context)?.ref = ref;

  /// Redirects to the sign-in route if the user is not signed in
  /// and the current route is not the sign-in route.
  final signedIn = ref.read(authRepositoryProvider).isSignedIn;
  final isSignInRoute =
      matchedLocation.startsWith(const SignInRoute().location);
  if (!signedIn && !isSignInRoute) {
    if (matchedLocation == '/') {
      // If the matched location is the root ('/'),
      // it does not save the current location.
      return const SignInRoute().location;
    } else {
      // Otherwise, it saves the current location in the `from` parameter
      // to redirect back after signing in.
      return SignInRoute(
        from: Uri.encodeComponent('${state.uri}'),
      ).location;
    }
  }

  return null;
}
