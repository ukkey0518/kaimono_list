// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appRouterHash() => r'4ad35e5f975eb98cd870dbedf3d99a513b837055';

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
    shoppingSheetRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    initialLocationControllerProvider,
    ...?initialLocationControllerProvider.allTransitiveDependencies,
    authRepositoryProvider,
    ...?authRepositoryProvider.allTransitiveDependencies,
    shoppingSheetRepositoryProvider,
    ...?shoppingSheetRepositoryProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppRouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
