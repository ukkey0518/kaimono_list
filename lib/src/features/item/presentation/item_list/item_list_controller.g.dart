// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemListControllerHash() =>
    r'd925965467af44b2cf4f4ece6e31b60d4139baac';

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
