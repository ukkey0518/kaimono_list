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
    r'3861a88253ad15544d757b6996c9896e960c8428';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userShoppingListsStream].
@ProviderFor(userShoppingListsStream)
const userShoppingListsStreamProvider = UserShoppingListsStreamFamily();

/// See also [userShoppingListsStream].
class UserShoppingListsStreamFamily
    extends Family<AsyncValue<List<UserShoppingList>>> {
  /// See also [userShoppingListsStream].
  const UserShoppingListsStreamFamily();

  /// See also [userShoppingListsStream].
  UserShoppingListsStreamProvider call(
    String userId,
  ) {
    return UserShoppingListsStreamProvider(
      userId,
    );
  }

  @override
  UserShoppingListsStreamProvider getProviderOverride(
    covariant UserShoppingListsStreamProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    userShoppingListSettingRepositoryProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    userShoppingListSettingRepositoryProvider,
    ...?userShoppingListSettingRepositoryProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userShoppingListsStreamProvider';
}

/// See also [userShoppingListsStream].
class UserShoppingListsStreamProvider
    extends AutoDisposeStreamProvider<List<UserShoppingList>> {
  /// See also [userShoppingListsStream].
  UserShoppingListsStreamProvider(
    String userId,
  ) : this._internal(
          (ref) => userShoppingListsStream(
            ref as UserShoppingListsStreamRef,
            userId,
          ),
          from: userShoppingListsStreamProvider,
          name: r'userShoppingListsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userShoppingListsStreamHash,
          dependencies: UserShoppingListsStreamFamily._dependencies,
          allTransitiveDependencies:
              UserShoppingListsStreamFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserShoppingListsStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<UserShoppingList>> Function(UserShoppingListsStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserShoppingListsStreamProvider._internal(
        (ref) => create(ref as UserShoppingListsStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<UserShoppingList>> createElement() {
    return _UserShoppingListsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserShoppingListsStreamProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserShoppingListsStreamRef
    on AutoDisposeStreamProviderRef<List<UserShoppingList>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserShoppingListsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<UserShoppingList>>
    with UserShoppingListsStreamRef {
  _UserShoppingListsStreamProviderElement(super.provider);

  @override
  String get userId => (origin as UserShoppingListsStreamProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
