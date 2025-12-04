import 'package:go_router/go_router.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/routing/app_router_redirect.dart';
import 'package:kaimono_list/src/routing/app_routes.dart';
import 'package:kaimono_list/src/routing/initial_location_controller.dart';
import 'package:kaimono_list/src/routing/router_refresh_stream_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(dependencies: [InitialLocationController])
GoRouter appRouter(Ref ref) {
  final initialLocation = ref.watch(initialLocationControllerProvider);

  return GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    refreshListenable: RouterRefreshStreamNotifier(
      ref.read(authRepositoryProvider).currentUserStream(),
    ),
    routes: $appRoutes,
    redirect: (context, state) => appRouterRedirect(context, state, ref),
  );
}
