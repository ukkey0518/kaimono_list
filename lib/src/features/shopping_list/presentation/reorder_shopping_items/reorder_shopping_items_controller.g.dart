// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_shopping_items_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reorderShoppingItemsControllerHash() =>
    r'6c52994fb79722dfb68e3d2e97cacc2678c7ff7c';

/// See also [ReorderShoppingItemsController].
@ProviderFor(ReorderShoppingItemsController)
final reorderShoppingItemsControllerProvider = AutoDisposeAsyncNotifierProvider<
    ReorderShoppingItemsController, void>.internal(
  ReorderShoppingItemsController.new,
  name: r'reorderShoppingItemsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reorderShoppingItemsControllerHash,
  dependencies: <ProviderOrFamily>[shoppingItemRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    shoppingItemRepositoryProvider,
    ...?shoppingItemRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$ReorderShoppingItemsController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
