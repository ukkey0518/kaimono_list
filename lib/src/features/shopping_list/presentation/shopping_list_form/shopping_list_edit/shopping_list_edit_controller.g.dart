// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListEditControllerHash() =>
    r'b419ae377adfd7ac319b0b3c77ca157a8423724b';

/// See also [ShoppingListEditController].
@ProviderFor(ShoppingListEditController)
final shoppingListEditControllerProvider =
    AutoDisposeAsyncNotifierProvider<ShoppingListEditController, void>.internal(
  ShoppingListEditController.new,
  name: r'shoppingListEditControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingListEditControllerHash,
  dependencies: <ProviderOrFamily>[shoppingListRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    shoppingListRepositoryProvider,
    ...?shoppingListRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$ShoppingListEditController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
