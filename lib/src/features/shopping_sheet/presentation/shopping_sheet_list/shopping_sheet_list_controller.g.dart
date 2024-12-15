// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingSheetListControllerHash() =>
    r'c551ad7375abf2d877b6f13171fc3bc365da9449';

/// See also [ShoppingSheetListController].
@ProviderFor(ShoppingSheetListController)
final shoppingSheetListControllerProvider = AutoDisposeAsyncNotifierProvider<
    ShoppingSheetListController, void>.internal(
  ShoppingSheetListController.new,
  name: r'shoppingSheetListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingSheetListControllerHash,
  dependencies: <ProviderOrFamily>[
    currentUserStreamProvider,
    shoppingSheetRepositoryProvider,
    shoppingSheetsByUserFutureProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    currentUserStreamProvider,
    ...?currentUserStreamProvider.allTransitiveDependencies,
    shoppingSheetRepositoryProvider,
    ...?shoppingSheetRepositoryProvider.allTransitiveDependencies,
    shoppingSheetsByUserFutureProvider,
    ...?shoppingSheetsByUserFutureProvider.allTransitiveDependencies
  },
);

typedef _$ShoppingSheetListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
