// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListControllerHash() =>
    r'862b26e78cd454ec78442f24fbc2632fa19cdf90';

/// See also [ShoppingListController].
@ProviderFor(ShoppingListController)
final shoppingListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ShoppingListController, void>.internal(
  ShoppingListController.new,
  name: r'shoppingListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingListControllerHash,
  dependencies: <ProviderOrFamily>[
    currentUserProvider,
    shoppingListRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    currentUserProvider,
    ...?currentUserProvider.allTransitiveDependencies,
    shoppingListRepositoryProvider,
    ...?shoppingListRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$ShoppingListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
