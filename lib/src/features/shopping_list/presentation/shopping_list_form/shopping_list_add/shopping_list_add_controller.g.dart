// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_add_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListAddControllerHash() =>
    r'07a721881f6346130bf1784732b33bda57c11b12';

/// See also [ShoppingListAddController].
@ProviderFor(ShoppingListAddController)
final shoppingListAddControllerProvider =
    AutoDisposeAsyncNotifierProvider<ShoppingListAddController, void>.internal(
  ShoppingListAddController.new,
  name: r'shoppingListAddControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingListAddControllerHash,
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

typedef _$ShoppingListAddController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
