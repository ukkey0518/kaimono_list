// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListControllerHash() =>
    r'adfc749e1fa837470348a31dc17d426ef23c72c5';

/// See also [ShoppingListController].
@ProviderFor(ShoppingListController)
final shoppingListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ShoppingListController, void>.internal(
  ShoppingListController.new,
  name: r'shoppingListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingListControllerHash,
  dependencies: <ProviderOrFamily>[shoppingItemRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    shoppingItemRepositoryProvider,
    ...?shoppingItemRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$ShoppingListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
