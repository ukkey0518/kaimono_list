// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemRepositoryHash() =>
    r'7f41325df2aabf5392e0928267e02901e8e7073d';

/// See also [shoppingItemRepository].
@ProviderFor(shoppingItemRepository)
final shoppingItemRepositoryProvider =
    AutoDisposeProvider<ShoppingItemRepository>.internal(
  shoppingItemRepository,
  name: r'shoppingItemRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingItemRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ShoppingItemRepositoryRef
    = AutoDisposeProviderRef<ShoppingItemRepository>;
String _$shoppingItemsStreamHash() =>
    r'faf0eeb055c8f53cedfbe3376370b5f467284b21';

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

/// See also [shoppingItemsStream].
@ProviderFor(shoppingItemsStream)
const shoppingItemsStreamProvider = ShoppingItemsStreamFamily();

/// See also [shoppingItemsStream].
class ShoppingItemsStreamFamily extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [shoppingItemsStream].
  const ShoppingItemsStreamFamily();

  /// See also [shoppingItemsStream].
  ShoppingItemsStreamProvider call(
    String shoppingListId,
  ) {
    return ShoppingItemsStreamProvider(
      shoppingListId,
    );
  }

  @override
  ShoppingItemsStreamProvider getProviderOverride(
    covariant ShoppingItemsStreamProvider provider,
  ) {
    return call(
      provider.shoppingListId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    shoppingItemRepositoryProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    shoppingItemRepositoryProvider,
    ...?shoppingItemRepositoryProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shoppingItemsStreamProvider';
}

/// See also [shoppingItemsStream].
class ShoppingItemsStreamProvider
    extends AutoDisposeStreamProvider<List<ShoppingItem>> {
  /// See also [shoppingItemsStream].
  ShoppingItemsStreamProvider(
    String shoppingListId,
  ) : this._internal(
          (ref) => shoppingItemsStream(
            ref as ShoppingItemsStreamRef,
            shoppingListId,
          ),
          from: shoppingItemsStreamProvider,
          name: r'shoppingItemsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemsStreamHash,
          dependencies: ShoppingItemsStreamFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemsStreamFamily._allTransitiveDependencies,
          shoppingListId: shoppingListId,
        );

  ShoppingItemsStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shoppingListId,
  }) : super.internal();

  final String shoppingListId;

  @override
  Override overrideWith(
    Stream<List<ShoppingItem>> Function(ShoppingItemsStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemsStreamProvider._internal(
        (ref) => create(ref as ShoppingItemsStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shoppingListId: shoppingListId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<ShoppingItem>> createElement() {
    return _ShoppingItemsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemsStreamProvider &&
        other.shoppingListId == shoppingListId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingListId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShoppingItemsStreamRef
    on AutoDisposeStreamProviderRef<List<ShoppingItem>> {
  /// The parameter `shoppingListId` of this provider.
  String get shoppingListId;
}

class _ShoppingItemsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<ShoppingItem>>
    with ShoppingItemsStreamRef {
  _ShoppingItemsStreamProviderElement(super.provider);

  @override
  String get shoppingListId =>
      (origin as ShoppingItemsStreamProvider).shoppingListId;
}

String _$shoppingItemFutureHash() =>
    r'2e0a6b78fd624f84f5b48648b468f7be799bf69a';

/// See also [shoppingItemFuture].
@ProviderFor(shoppingItemFuture)
const shoppingItemFutureProvider = ShoppingItemFutureFamily();

/// See also [shoppingItemFuture].
class ShoppingItemFutureFamily extends Family<AsyncValue<ShoppingItem?>> {
  /// See also [shoppingItemFuture].
  const ShoppingItemFutureFamily();

  /// See also [shoppingItemFuture].
  ShoppingItemFutureProvider call(
    String shoppingListId,
    String shoppingItemId,
  ) {
    return ShoppingItemFutureProvider(
      shoppingListId,
      shoppingItemId,
    );
  }

  @override
  ShoppingItemFutureProvider getProviderOverride(
    covariant ShoppingItemFutureProvider provider,
  ) {
    return call(
      provider.shoppingListId,
      provider.shoppingItemId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    shoppingItemRepositoryProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    shoppingItemRepositoryProvider,
    ...?shoppingItemRepositoryProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shoppingItemFutureProvider';
}

/// See also [shoppingItemFuture].
class ShoppingItemFutureProvider
    extends AutoDisposeFutureProvider<ShoppingItem?> {
  /// See also [shoppingItemFuture].
  ShoppingItemFutureProvider(
    String shoppingListId,
    String shoppingItemId,
  ) : this._internal(
          (ref) => shoppingItemFuture(
            ref as ShoppingItemFutureRef,
            shoppingListId,
            shoppingItemId,
          ),
          from: shoppingItemFutureProvider,
          name: r'shoppingItemFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemFutureHash,
          dependencies: ShoppingItemFutureFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemFutureFamily._allTransitiveDependencies,
          shoppingListId: shoppingListId,
          shoppingItemId: shoppingItemId,
        );

  ShoppingItemFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shoppingListId,
    required this.shoppingItemId,
  }) : super.internal();

  final String shoppingListId;
  final String shoppingItemId;

  @override
  Override overrideWith(
    FutureOr<ShoppingItem?> Function(ShoppingItemFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemFutureProvider._internal(
        (ref) => create(ref as ShoppingItemFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shoppingListId: shoppingListId,
        shoppingItemId: shoppingItemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ShoppingItem?> createElement() {
    return _ShoppingItemFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemFutureProvider &&
        other.shoppingListId == shoppingListId &&
        other.shoppingItemId == shoppingItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingListId.hashCode);
    hash = _SystemHash.combine(hash, shoppingItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShoppingItemFutureRef on AutoDisposeFutureProviderRef<ShoppingItem?> {
  /// The parameter `shoppingListId` of this provider.
  String get shoppingListId;

  /// The parameter `shoppingItemId` of this provider.
  String get shoppingItemId;
}

class _ShoppingItemFutureProviderElement
    extends AutoDisposeFutureProviderElement<ShoppingItem?>
    with ShoppingItemFutureRef {
  _ShoppingItemFutureProviderElement(super.provider);

  @override
  String get shoppingListId =>
      (origin as ShoppingItemFutureProvider).shoppingListId;
  @override
  String get shoppingItemId =>
      (origin as ShoppingItemFutureProvider).shoppingItemId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
