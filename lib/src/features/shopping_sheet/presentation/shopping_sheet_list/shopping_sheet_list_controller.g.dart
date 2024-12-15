// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingSheetListControllerHash() =>
    r'b97bf4d1a345c0f95640051a2afacb6b21ba5f26';

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
    shoppingSheetRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    currentUserStreamProvider,
    ...?currentUserStreamProvider.allTransitiveDependencies,
    shoppingSheetRepositoryProvider,
    ...?shoppingSheetRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$ShoppingSheetListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
