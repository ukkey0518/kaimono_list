// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemRepositoryHash() =>
    r'1b0c6f398642f873104d2390454fcc5483a5e333';

/// See also [shoppingItemRepository].
@ProviderFor(shoppingItemRepository)
final shoppingItemRepositoryProvider =
    AutoDisposeProvider<ShoppingItemRepository>.internal(
      shoppingItemRepository,
      name: r'shoppingItemRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$shoppingItemRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShoppingItemRepositoryRef =
    AutoDisposeProviderRef<ShoppingItemRepository>;
String _$shoppingItemsStreamHash() =>
    r'63ff5c2478e1f03e3829a91ca3cbb0414b06b549';

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
  ShoppingItemsStreamProvider call(String shoppingSheetId) {
    return ShoppingItemsStreamProvider(shoppingSheetId);
  }

  @override
  ShoppingItemsStreamProvider getProviderOverride(
    covariant ShoppingItemsStreamProvider provider,
  ) {
    return call(provider.shoppingSheetId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

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
  ShoppingItemsStreamProvider(String shoppingSheetId)
    : this._internal(
        (ref) =>
            shoppingItemsStream(ref as ShoppingItemsStreamRef, shoppingSheetId),
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
    r'5b67b53ffc827b1ed1434c2555b8fdf6a5e64c72';

/// See also [shoppingItemsFuture].
@ProviderFor(shoppingItemsFuture)
const shoppingItemsFutureProvider = ShoppingItemsFutureFamily();

/// See also [shoppingItemsFuture].
class ShoppingItemsFutureFamily extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [shoppingItemsFuture].
  const ShoppingItemsFutureFamily();

  /// See also [shoppingItemsFuture].
  ShoppingItemsFutureProvider call(String shoppingSheetId) {
    return ShoppingItemsFutureProvider(shoppingSheetId);
  }

  @override
  ShoppingItemsFutureProvider getProviderOverride(
    covariant ShoppingItemsFutureProvider provider,
  ) {
    return call(provider.shoppingSheetId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

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
  ShoppingItemsFutureProvider(String shoppingSheetId)
    : this._internal(
        (ref) =>
            shoppingItemsFuture(ref as ShoppingItemsFutureRef, shoppingSheetId),
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
    r'a611e06b83a29f19f925e66e30780ff173286bf2';

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
  IsAnyCompletedShoppingItemExistsStreamProvider call(String shoppingSheetId) {
    return IsAnyCompletedShoppingItemExistsStreamProvider(shoppingSheetId);
  }

  @override
  IsAnyCompletedShoppingItemExistsStreamProvider getProviderOverride(
    covariant IsAnyCompletedShoppingItemExistsStreamProvider provider,
  ) {
    return call(provider.shoppingSheetId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

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
  IsAnyCompletedShoppingItemExistsStreamProvider(String shoppingSheetId)
    : this._internal(
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
