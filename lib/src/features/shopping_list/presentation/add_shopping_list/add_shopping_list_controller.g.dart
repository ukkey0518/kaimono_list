// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_shopping_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addShoppingListControllerHash() =>
    r'd5cde6d6fb1a5d64f4536113198c866130f9ef83';

/// See also [AddShoppingListController].
@ProviderFor(AddShoppingListController)
final addShoppingListControllerProvider =
    AutoDisposeAsyncNotifierProvider<AddShoppingListController, void>.internal(
  AddShoppingListController.new,
  name: r'addShoppingListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addShoppingListControllerHash,
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

typedef _$AddShoppingListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
