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
    r'ccb6a5acca35aee81290c0b1be550e36fa5f221c';

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
    String shoppingSheetId,
  ) {
    return ShoppingItemsStreamProvider(
      shoppingSheetId,
    );
  }

  @override
  ShoppingItemsStreamProvider getProviderOverride(
    covariant ShoppingItemsStreamProvider provider,
  ) {
    return call(
      provider.shoppingSheetId,
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
    String shoppingSheetId,
  ) : this._internal(
          (ref) => shoppingItemsStream(
            ref as ShoppingItemsStreamRef,
            shoppingSheetId,
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
          shoppingSheetId: shoppingSheetId,
        );

  ShoppingItemsStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shoppingSheetId,
  }) : super.internal();

  final String shoppingSheetId;

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
        shoppingSheetId: shoppingSheetId,
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
        other.shoppingSheetId == shoppingSheetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingSheetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShoppingItemsStreamRef
    on AutoDisposeStreamProviderRef<List<ShoppingItem>> {
  /// The parameter `shoppingSheetId` of this provider.
  String get shoppingSheetId;
}

class _ShoppingItemsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<ShoppingItem>>
    with ShoppingItemsStreamRef {
  _ShoppingItemsStreamProviderElement(super.provider);

  @override
  String get shoppingSheetId =>
      (origin as ShoppingItemsStreamProvider).shoppingSheetId;
}

String _$shoppingItemsFutureHash() =>
    r'949738c265773ddbb780493c4e6eacbf9a114635';

/// See also [shoppingItemsFuture].
@ProviderFor(shoppingItemsFuture)
const shoppingItemsFutureProvider = ShoppingItemsFutureFamily();

/// See also [shoppingItemsFuture].
class ShoppingItemsFutureFamily extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [shoppingItemsFuture].
  const ShoppingItemsFutureFamily();

  /// See also [shoppingItemsFuture].
  ShoppingItemsFutureProvider call(
    String shoppingSheetId,
  ) {
    return ShoppingItemsFutureProvider(
      shoppingSheetId,
    );
  }

  @override
  ShoppingItemsFutureProvider getProviderOverride(
    covariant ShoppingItemsFutureProvider provider,
  ) {
    return call(
      provider.shoppingSheetId,
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
    String shoppingSheetId,
  ) : this._internal(
          (ref) => shoppingItemsFuture(
            ref as ShoppingItemsFutureRef,
            shoppingSheetId,
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
          shoppingSheetId: shoppingSheetId,
        );

  ShoppingItemsFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shoppingSheetId,
  }) : super.internal();

  final String shoppingSheetId;

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
        shoppingSheetId: shoppingSheetId,
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
        other.shoppingSheetId == shoppingSheetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingSheetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShoppingItemsFutureRef
    on AutoDisposeFutureProviderRef<List<ShoppingItem>> {
  /// The parameter `shoppingSheetId` of this provider.
  String get shoppingSheetId;
}

class _ShoppingItemsFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<ShoppingItem>>
    with ShoppingItemsFutureRef {
  _ShoppingItemsFutureProviderElement(super.provider);

  @override
  String get shoppingSheetId =>
      (origin as ShoppingItemsFutureProvider).shoppingSheetId;
}

String _$isAnyCompletedShoppingItemExistsStreamHash() =>
    r'ca2b4d9fef54e5495e60ec1d09c45399f22d8a58';

/// See also [isAnyCompletedShoppingItemExistsStream].
@ProviderFor(isAnyCompletedShoppingItemExistsStream)
const isAnyCompletedShoppingItemExistsStreamProvider =
    IsAnyCompletedShoppingItemExistsStreamFamily();

/// See also [isAnyCompletedShoppingItemExistsStream].
class IsAnyCompletedShoppingItemExistsStreamFamily
    extends Family<AsyncValue<bool>> {
  /// See also [isAnyCompletedShoppingItemExistsStream].
  const IsAnyCompletedShoppingItemExistsStreamFamily();

  /// See also [isAnyCompletedShoppingItemExistsStream].
  IsAnyCompletedShoppingItemExistsStreamProvider call(
    String shoppingSheetId,
  ) {
    return IsAnyCompletedShoppingItemExistsStreamProvider(
      shoppingSheetId,
    );
  }

  @override
  IsAnyCompletedShoppingItemExistsStreamProvider getProviderOverride(
    covariant IsAnyCompletedShoppingItemExistsStreamProvider provider,
  ) {
    return call(
      provider.shoppingSheetId,
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
  String? get name => r'isAnyCompletedShoppingItemExistsStreamProvider';
}

/// See also [isAnyCompletedShoppingItemExistsStream].
class IsAnyCompletedShoppingItemExistsStreamProvider
    extends AutoDisposeStreamProvider<bool> {
  /// See also [isAnyCompletedShoppingItemExistsStream].
  IsAnyCompletedShoppingItemExistsStreamProvider(
    String shoppingSheetId,
  ) : this._internal(
          (ref) => isAnyCompletedShoppingItemExistsStream(
            ref as IsAnyCompletedShoppingItemExistsStreamRef,
            shoppingSheetId,
          ),
          from: isAnyCompletedShoppingItemExistsStreamProvider,
          name: r'isAnyCompletedShoppingItemExistsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isAnyCompletedShoppingItemExistsStreamHash,
          dependencies:
              IsAnyCompletedShoppingItemExistsStreamFamily._dependencies,
          allTransitiveDependencies:
              IsAnyCompletedShoppingItemExistsStreamFamily
                  ._allTransitiveDependencies,
          shoppingSheetId: shoppingSheetId,
        );

  IsAnyCompletedShoppingItemExistsStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shoppingSheetId,
  }) : super.internal();

  final String shoppingSheetId;

  @override
  Override overrideWith(
    Stream<bool> Function(IsAnyCompletedShoppingItemExistsStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsAnyCompletedShoppingItemExistsStreamProvider._internal(
        (ref) => create(ref as IsAnyCompletedShoppingItemExistsStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shoppingSheetId: shoppingSheetId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _IsAnyCompletedShoppingItemExistsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsAnyCompletedShoppingItemExistsStreamProvider &&
        other.shoppingSheetId == shoppingSheetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingSheetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsAnyCompletedShoppingItemExistsStreamRef
    on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `shoppingSheetId` of this provider.
  String get shoppingSheetId;
}

class _IsAnyCompletedShoppingItemExistsStreamProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with IsAnyCompletedShoppingItemExistsStreamRef {
  _IsAnyCompletedShoppingItemExistsStreamProviderElement(super.provider);

  @override
  String get shoppingSheetId =>
      (origin as IsAnyCompletedShoppingItemExistsStreamProvider)
          .shoppingSheetId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
