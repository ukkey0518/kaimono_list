// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appRouterHash() => r'4871de7a49f882bdacace615f1abc43b0be3d2f9';

/// See also [appRouter].
@ProviderFor(appRouter)
final appRouterProvider = AutoDisposeProvider<GoRouter>.internal(
  appRouter,
  name: r'appRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appRouterHash,
  dependencies: <ProviderOrFamily>[
    initialLocationControllerProvider,
    authRepositoryProvider,
    shoppingListRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    initialLocationControllerProvider,
    ...?initialLocationControllerProvider.allTransitiveDependencies,
    authRepositoryProvider,
    ...?authRepositoryProvider.allTransitiveDependencies,
    shoppingListRepositoryProvider,
    ...?shoppingListRepositoryProvider.allTransitiveDependencies
  },
);

typedef AppRouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
