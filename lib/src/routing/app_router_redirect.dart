import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/routing/app_router.dart';
import 'package:kaimono_list/src/routing/app_router_ref_scope.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';

Future<String?> appRouterRedirect(
  BuildContext context,
  GoRouterState state,
  AppRouterRef ref,
) async {
  final matchedLocation = state.matchedLocation;

  /// Set the [AppRouterRef] instance to the [AppRouterRefScope] widget
  AppRouterRefScope.maybeOf(context)?.ref = ref;

  final authRepository = ref.read(authRepositoryProvider);

  final signedIn = authRepository.isSignedIn;

  String signInLocation([Uri? fromUri]) {
    return fromUri == null
        ? const SignInRoute().location
        : SignInRoute(
            from: Uri.encodeComponent(fromUri.toString()),
          ).location;
  }

  /// ログインしていない状態でログイン画面以外にアクセスしようとした場合、ログイン画面にリダイレクトする
  if (!signedIn && !matchedLocation.startsWith(signInLocation())) {
    return signInLocation(
      // ログイン後にリダイレクトするため元のURIを保持
      // - Rootの場合は保存しない
      matchedLocation == '/' ? null : state.uri,
    );
  }

  /// ログインしている状態でログイン画面にアクセスしようとした場合、元のURIにリダイレクトする
  /// - 元のURIがない場合はRootにリダイレクトする
  if (signedIn && matchedLocation.startsWith(signInLocation())) {
    final from = state.uri.queryParameters['from'] ?? '';
    return from.isNotEmpty ? Uri.decodeComponent(from) : '/';
  }

  return null;
}
