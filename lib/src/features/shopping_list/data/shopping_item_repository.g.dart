// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemRepositoryHash() =>
    r'78d6b2d570bccab49373699c70c29a559c1cfbe9';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShoppingItemRepositoryRef
    = AutoDisposeProviderRef<ShoppingItemRepository>;
String _$shoppingItemsStreamHash() =>
    r'35c08df3f05e8cce2d140f6441db63335f7213ed';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$shoppingItemsFutureHash() =>
    r'b7596b36110aeacaefe175136d1c62903706e48f';

/// See also [shoppingItemsFuture].
@ProviderFor(shoppingItemsFuture)
const shoppingItemsFutureProvider = ShoppingItemsFutureFamily();

/// See also [shoppingItemsFuture].
class ShoppingItemsFutureFamily extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [shoppingItemsFuture].
  const ShoppingItemsFutureFamily();

  /// See also [shoppingItemsFuture].
  ShoppingItemsFutureProvider call(
    String shoppingListId,
  ) {
    return ShoppingItemsFutureProvider(
      shoppingListId,
    );
  }

  @override
  ShoppingItemsFutureProvider getProviderOverride(
    covariant ShoppingItemsFutureProvider provider,
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
  String? get name => r'shoppingItemsFutureProvider';
}

/// See also [shoppingItemsFuture].
class ShoppingItemsFutureProvider
    extends AutoDisposeFutureProvider<List<ShoppingItem>> {
  /// See also [shoppingItemsFuture].
  ShoppingItemsFutureProvider(
    String shoppingListId,
  ) : this._internal(
          (ref) => shoppingItemsFuture(
            ref as ShoppingItemsFutureRef,
            shoppingListId,
          ),
          from: shoppingItemsFutureProvider,
          name: r'shoppingItemsFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemsFutureHash,
          dependencies: ShoppingItemsFutureFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemsFutureFamily._allTransitiveDependencies,
          shoppingListId: shoppingListId,
        );

  ShoppingItemsFutureProvider._internal(
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
    FutureOr<List<ShoppingItem>> Function(ShoppingItemsFutureRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemsFutureProvider._internal(
        (ref) => create(ref as ShoppingItemsFutureRef),
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
  AutoDisposeFutureProviderElement<List<ShoppingItem>> createElement() {
    return _ShoppingItemsFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemsFutureProvider &&
        other.shoppingListId == shoppingListId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingListId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShoppingItemsFutureRef
    on AutoDisposeFutureProviderRef<List<ShoppingItem>> {
  /// The parameter `shoppingListId` of this provider.
  String get shoppingListId;
}

class _ShoppingItemsFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<ShoppingItem>>
    with ShoppingItemsFutureRef {
  _ShoppingItemsFutureProviderElement(super.provider);

  @override
  String get shoppingListId =>
      (origin as ShoppingItemsFutureProvider).shoppingListId;
}

String _$hasAnyPurchasedShoppingItemStreamHash() =>
    r'91af4922febe4245a062a2a6bcc042da7f31a197';

/// See also [hasAnyPurchasedShoppingItemStream].
@ProviderFor(hasAnyPurchasedShoppingItemStream)
const hasAnyPurchasedShoppingItemStreamProvider =
    HasAnyPurchasedShoppingItemStreamFamily();

/// See also [hasAnyPurchasedShoppingItemStream].
class HasAnyPurchasedShoppingItemStreamFamily extends Family<AsyncValue<bool>> {
  /// See also [hasAnyPurchasedShoppingItemStream].
  const HasAnyPurchasedShoppingItemStreamFamily();

  /// See also [hasAnyPurchasedShoppingItemStream].
  HasAnyPurchasedShoppingItemStreamProvider call(
    String shoppingListId,
  ) {
    return HasAnyPurchasedShoppingItemStreamProvider(
      shoppingListId,
    );
  }

  @override
  HasAnyPurchasedShoppingItemStreamProvider getProviderOverride(
    covariant HasAnyPurchasedShoppingItemStreamProvider provider,
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
  String? get name => r'hasAnyPurchasedShoppingItemStreamProvider';
}

/// See also [hasAnyPurchasedShoppingItemStream].
class HasAnyPurchasedShoppingItemStreamProvider
    extends AutoDisposeStreamProvider<bool> {
  /// See also [hasAnyPurchasedShoppingItemStream].
  HasAnyPurchasedShoppingItemStreamProvider(
    String shoppingListId,
  ) : this._internal(
          (ref) => hasAnyPurchasedShoppingItemStream(
            ref as HasAnyPurchasedShoppingItemStreamRef,
            shoppingListId,
          ),
          from: hasAnyPurchasedShoppingItemStreamProvider,
          name: r'hasAnyPurchasedShoppingItemStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hasAnyPurchasedShoppingItemStreamHash,
          dependencies: HasAnyPurchasedShoppingItemStreamFamily._dependencies,
          allTransitiveDependencies: HasAnyPurchasedShoppingItemStreamFamily
              ._allTransitiveDependencies,
          shoppingListId: shoppingListId,
        );

  HasAnyPurchasedShoppingItemStreamProvider._internal(
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
    Stream<bool> Function(HasAnyPurchasedShoppingItemStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HasAnyPurchasedShoppingItemStreamProvider._internal(
        (ref) => create(ref as HasAnyPurchasedShoppingItemStreamRef),
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
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _HasAnyPurchasedShoppingItemStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HasAnyPurchasedShoppingItemStreamProvider &&
        other.shoppingListId == shoppingListId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingListId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HasAnyPurchasedShoppingItemStreamRef
    on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `shoppingListId` of this provider.
  String get shoppingListId;
}

class _HasAnyPurchasedShoppingItemStreamProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with HasAnyPurchasedShoppingItemStreamRef {
  _HasAnyPurchasedShoppingItemStreamProviderElement(super.provider);

  @override
  String get shoppingListId =>
      (origin as HasAnyPurchasedShoppingItemStreamProvider).shoppingListId;
}

String _$shoppingItemFutureHash() =>
    r'201960ae62ddb334158bee927ff248c9750a581b';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
