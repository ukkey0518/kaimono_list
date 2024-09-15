// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListRepositoryHash() =>
    r'6b2b6d99fe539e6ecd65230ce324e4f967df7cbf';

/// See also [shoppingListRepository].
@ProviderFor(shoppingListRepository)
final shoppingListRepositoryProvider =
    AutoDisposeProvider<ShoppingListRepository>.internal(
  shoppingListRepository,
  name: r'shoppingListRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingListRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ShoppingListRepositoryRef
    = AutoDisposeProviderRef<ShoppingListRepository>;
String _$shoppingListFutureHash() =>
    r'f65f87bd46f128adad3d2f5b723cbc3da201c5d0';

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

/// See also [shoppingListFuture].
@ProviderFor(shoppingListFuture)
const shoppingListFutureProvider = ShoppingListFutureFamily();

/// See also [shoppingListFuture].
class ShoppingListFutureFamily extends Family<AsyncValue<ShoppingList?>> {
  /// See also [shoppingListFuture].
  const ShoppingListFutureFamily();

  /// See also [shoppingListFuture].
  ShoppingListFutureProvider call(
    String shoppingListId,
  ) {
    return ShoppingListFutureProvider(
      shoppingListId,
    );
  }

  @override
  ShoppingListFutureProvider getProviderOverride(
    covariant ShoppingListFutureProvider provider,
  ) {
    return call(
      provider.shoppingListId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    shoppingListRepositoryProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    shoppingListRepositoryProvider,
    ...?shoppingListRepositoryProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shoppingListFutureProvider';
}

/// See also [shoppingListFuture].
class ShoppingListFutureProvider
    extends AutoDisposeFutureProvider<ShoppingList?> {
  /// See also [shoppingListFuture].
  ShoppingListFutureProvider(
    String shoppingListId,
  ) : this._internal(
          (ref) => shoppingListFuture(
            ref as ShoppingListFutureRef,
            shoppingListId,
          ),
          from: shoppingListFutureProvider,
          name: r'shoppingListFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingListFutureHash,
          dependencies: ShoppingListFutureFamily._dependencies,
          allTransitiveDependencies:
              ShoppingListFutureFamily._allTransitiveDependencies,
          shoppingListId: shoppingListId,
        );

  ShoppingListFutureProvider._internal(
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
    FutureOr<ShoppingList?> Function(ShoppingListFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingListFutureProvider._internal(
        (ref) => create(ref as ShoppingListFutureRef),
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
  AutoDisposeFutureProviderElement<ShoppingList?> createElement() {
    return _ShoppingListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListFutureProvider &&
        other.shoppingListId == shoppingListId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shoppingListId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShoppingListFutureRef on AutoDisposeFutureProviderRef<ShoppingList?> {
  /// The parameter `shoppingListId` of this provider.
  String get shoppingListId;
}

class _ShoppingListFutureProviderElement
    extends AutoDisposeFutureProviderElement<ShoppingList?>
    with ShoppingListFutureRef {
  _ShoppingListFutureProviderElement(super.provider);

  @override
  String get shoppingListId =>
      (origin as ShoppingListFutureProvider).shoppingListId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
