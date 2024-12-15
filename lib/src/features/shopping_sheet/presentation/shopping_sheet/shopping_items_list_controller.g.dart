// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_items_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemsListControllerHash() =>
    r'bf7a0e9550206efc83776a6ccdea321641e6e8bb';

/// See also [ShoppingItemsListController].
@ProviderFor(ShoppingItemsListController)
final shoppingItemsListControllerProvider = AutoDisposeAsyncNotifierProvider<
    ShoppingItemsListController, void>.internal(
  ShoppingItemsListController.new,
  name: r'shoppingItemsListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingItemsListControllerHash,
  dependencies: <ProviderOrFamily>[shoppingItemRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    shoppingItemRepositoryProvider,
    ...?shoppingItemRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$ShoppingItemsListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
