// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListEditControllerHash() =>
    r'1a6a3c108231fe06909dec307595d5f2ab0a3fa5';

/// See also [ShoppingListEditController].
@ProviderFor(ShoppingListEditController)
final shoppingListEditControllerProvider =
    AutoDisposeAsyncNotifierProvider<ShoppingListEditController, void>.internal(
  ShoppingListEditController.new,
  name: r'shoppingListEditControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingListEditControllerHash,
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

typedef _$ShoppingListEditController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member