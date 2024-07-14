import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/routing/router_refresh_stream_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(
  dependencies: [
    authRepository,
  ],
)
GoRouter appRouter(AppRouterRef ref) {
  const rootLocation = '/';
  const initialLocation = '/';
  final authRepository = ref.read(authRepositoryProvider);

  return GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    refreshListenable: RouterRefreshStreamNotifier(
      authRepository.authStateChanges,
    ),
    routes: $appRoutes,
    redirect: (context, state) {
      final matchedLocation = state.matchedLocation;
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
          // - 初期ページの場合は保存しない
          matchedLocation == rootLocation ? null : state.uri,
        );
      }

      /// ログインしている状態でログイン画面にアクセスしようとした場合、元のURIにリダイレクトする
      /// - 元のURIがない場合は初期ページにリダイレクトする
      if (signedIn && matchedLocation.startsWith(signInLocation())) {
        final from = state.uri.queryParameters['from'] ?? '';
        return from.isNotEmpty ? Uri.decodeComponent(from) : rootLocation;
      }

      /// Rootにアクセスした場合、初期画面にリダイレクトする
      if (matchedLocation == rootLocation) {
        return initialLocation;
      }
      return null;
    },
  );
}
