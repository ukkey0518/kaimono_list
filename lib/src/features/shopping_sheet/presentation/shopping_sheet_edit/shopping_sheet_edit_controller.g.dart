// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingSheetEditControllerHash() =>
    r'6149bb43ef6622cbe3ba3ac665cd07044bd51352';

/// See also [ShoppingSheetEditController].
@ProviderFor(ShoppingSheetEditController)
final shoppingSheetEditControllerProvider = AutoDisposeAsyncNotifierProvider<
    ShoppingSheetEditController, void>.internal(
  ShoppingSheetEditController.new,
  name: r'shoppingSheetEditControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingSheetEditControllerHash,
  dependencies: <ProviderOrFamily>[
    shoppingSheetRepositoryProvider,
    shoppingItemRepositoryProvider,
    shoppingSheetFutureProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    shoppingSheetRepositoryProvider,
    ...?shoppingSheetRepositoryProvider.allTransitiveDependencies,
    shoppingItemRepositoryProvider,
    ...?shoppingItemRepositoryProvider.allTransitiveDependencies,
    shoppingSheetFutureProvider,
    ...?shoppingSheetFutureProvider.allTransitiveDependencies
  },
);

typedef _$ShoppingSheetEditController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
