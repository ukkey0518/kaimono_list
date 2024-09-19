// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_shopping_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userShoppingListRepositoryHash() =>
    r'a31e2f7210db1a47bd99ad51842025e9080a552e';

/// See also [userShoppingListRepository].
@ProviderFor(userShoppingListRepository)
final userShoppingListRepositoryProvider =
    AutoDisposeProvider<UserShoppingListRepository>.internal(
  userShoppingListRepository,
  name: r'userShoppingListRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userShoppingListRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef UserShoppingListRepositoryRef
    = AutoDisposeProviderRef<UserShoppingListRepository>;
String _$userShoppingListsStreamHash() =>
    r'72924434aa03162ef626a78c3e3281412a4935d0';

/// See also [userShoppingListsStream].
@ProviderFor(userShoppingListsStream)
final userShoppingListsStreamProvider =
    AutoDisposeStreamProvider<List<UserShoppingList>>.internal(
  userShoppingListsStream,
  name: r'userShoppingListsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userShoppingListsStreamHash,
  dependencies: <ProviderOrFamily>[
    currentUserStreamProvider,
    userShoppingListRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    currentUserStreamProvider,
    ...?currentUserStreamProvider.allTransitiveDependencies,
    userShoppingListRepositoryProvider,
    ...?userShoppingListRepositoryProvider.allTransitiveDependencies
  },
);

typedef UserShoppingListsStreamRef
    = AutoDisposeStreamProviderRef<List<UserShoppingList>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
