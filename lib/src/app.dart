import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/routing/app_router.dart';
import 'package:kaimono_list/src/routing/app_router_ref_scope.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return AppRouterRefScope(
      child: MaterialApp.router(
        title: 'かいものリスト',
        theme: ThemeData(useMaterial3: true),
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
      ),
    );
  }
}
