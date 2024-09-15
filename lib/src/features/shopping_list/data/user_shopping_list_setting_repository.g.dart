// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_shopping_list_setting_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userShoppingListSettingRepositoryHash() =>
    r'e76d19b9cf98e2336518805fb359ee1021f2bade';

/// See also [userShoppingListSettingRepository].
@ProviderFor(userShoppingListSettingRepository)
final userShoppingListSettingRepositoryProvider =
    AutoDisposeProvider<UserShoppingListSettingRepository>.internal(
  userShoppingListSettingRepository,
  name: r'userShoppingListSettingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userShoppingListSettingRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef UserShoppingListSettingRepositoryRef
    = AutoDisposeProviderRef<UserShoppingListSettingRepository>;
String _$userShoppingListsStreamHash() =>
    r'098b3abf2254d813c1a3c3df7e84f03420a4035d';

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
    authStateChangesStreamProvider,
    userShoppingListSettingRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    authStateChangesStreamProvider,
    ...?authStateChangesStreamProvider.allTransitiveDependencies,
    userShoppingListSettingRepositoryProvider,
    ...?userShoppingListSettingRepositoryProvider.allTransitiveDependencies
  },
);

typedef UserShoppingListsStreamRef
    = AutoDisposeStreamProviderRef<List<UserShoppingList>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
