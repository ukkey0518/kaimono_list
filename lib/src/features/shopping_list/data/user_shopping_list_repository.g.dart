// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_shopping_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userShoppingListRepositoryHash() =>
    r'09ccad472c9b9f7c32546a5a8fb45378df003c93';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserShoppingListRepositoryRef
    = AutoDisposeProviderRef<UserShoppingListRepository>;
String _$userShoppingListsStreamHash() =>
    r'9f1549d6933e0bf6aae865fa4ede5201ab90a035';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserShoppingListsStreamRef
    = AutoDisposeStreamProviderRef<List<UserShoppingList>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
