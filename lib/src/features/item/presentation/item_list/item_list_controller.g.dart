// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemListControllerHash() =>
    r'ce5479f6626dbae23a91add282011e59275a9cc1';

/// See also [ItemListController].
@ProviderFor(ItemListController)
final itemListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ItemListController, void>.internal(
  ItemListController.new,
  name: r'itemListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemListControllerHash,
  dependencies: <ProviderOrFamily>[itemRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    itemRepositoryProvider,
    ...?itemRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$ItemListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
