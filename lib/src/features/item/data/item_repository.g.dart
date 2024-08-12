// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemRepositoryHash() => r'c7ffbb5c50bdbf40fa83e86c4b9237a048b804aa';

/// See also [itemRepository].
@ProviderFor(itemRepository)
final itemRepositoryProvider = AutoDisposeProvider<ItemRepository>.internal(
  itemRepository,
  name: r'itemRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ItemRepositoryRef = AutoDisposeProviderRef<ItemRepository>;
String _$itemsListStreamHash() => r'470a766ee530686c998ab9c1fc2e567275674591';

/// See also [itemsListStream].
@ProviderFor(itemsListStream)
final itemsListStreamProvider = AutoDisposeStreamProvider<List<Item>>.internal(
  itemsListStream,
  name: r'itemsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemsListStreamHash,
  dependencies: <ProviderOrFamily>[itemRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    itemRepositoryProvider,
    ...?itemRepositoryProvider.allTransitiveDependencies
  },
);

typedef ItemsListStreamRef = AutoDisposeStreamProviderRef<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
