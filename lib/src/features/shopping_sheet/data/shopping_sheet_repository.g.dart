// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingSheetRepositoryHash() =>
    r'5ae7439d270a1e075983ebfb9fdada9a3cd888ce';

/// See also [shoppingSheetRepository].
@ProviderFor(shoppingSheetRepository)
final shoppingSheetRepositoryProvider =
    AutoDisposeProvider<ShoppingSheetRepository>.internal(
  shoppingSheetRepository,
  name: r'shoppingSheetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingSheetRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShoppingSheetRepositoryRef
    = AutoDisposeProviderRef<ShoppingSheetRepository>;
String _$shoppingSheetsByUserFutureHash() =>
    r'8847bba3b855f316f7f8aba4b15a243871dd7cdd';

/// See also [shoppingSheetsByUserFuture].
@ProviderFor(shoppingSheetsByUserFuture)
final shoppingSheetsByUserFutureProvider =
    AutoDisposeFutureProvider<List<ShoppingSheet>>.internal(
  shoppingSheetsByUserFuture,
  name: r'shoppingSheetsByUserFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingSheetsByUserFutureHash,
  dependencies: <ProviderOrFamily>[
    currentUserStreamProvider,
    shoppingSheetRepositoryProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    currentUserStreamProvider,
    ...?currentUserStreamProvider.allTransitiveDependencies,
    shoppingSheetRepositoryProvider,
    ...?shoppingSheetRepositoryProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShoppingSheetsByUserFutureRef
    = AutoDisposeFutureProviderRef<List<ShoppingSheet>>;
String _$shoppingSheetFutureHash() =>
    r'd589dc551c3295cc1deacab1bbc29c97fa35c837';

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

/// See also [shoppingSheetFuture].
@ProviderFor(shoppingSheetFuture)
const shoppingSheetFutureProvider = ShoppingSheetFutureFamily();

/// See also [shoppingSheetFuture].
class ShoppingSheetFutureFamily extends Family<AsyncValue<ShoppingSheet?>> {
  /// See also [shoppingSheetFuture].
  const ShoppingSheetFutureFamily();

  /// See also [shoppingSheetFuture].
  ShoppingSheetFutureProvider call(
    String shoppingSheetId,
  ) {
    return ShoppingSheetFutureProvider(
      shoppingSheetId,
    );
  }

  @override
  ShoppingSheetFutureProvider getProviderOverride(
    covariant ShoppingSheetFutureProvider provider,
  ) {
    return call(
      provider.shoppingSheetId,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    shoppingSheetRepositoryProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    shoppingSheetRepositoryProvider,
    ...?shoppingSheetRepositoryProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shoppingSheetFutureProvider';
}

/// See also [shoppingSheetFuture].
class ShoppingSheetFutureProvider
    extends AutoDisposeFutureProvider<ShoppingSheet?> {
  /// See also [shoppingSheetFuture].
  ShoppingSheetFutureProvider(
    String shoppingSheetId,
  ) : this._internal(
          (ref) => shoppingSheetFuture(
            ref as ShoppingSheetFutureRef,
            shoppingSheetId,
          ),
          from: shoppingSheetFutureProvider,
          name: r'shoppingSheetFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingSheetFutureHash,
          dependencies: ShoppingSheetFutureFamily._dependencies,
          allTransitiveDependencies:
              ShoppingSheetFutureFamily._allTransitiveDependencies,
          shoppingSheetId: shoppingSheetId,
        );

  ShoppingSheetFutureProvider._internal(
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
    FutureOr<ShoppingSheet?> Function(ShoppingSheetFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingSheetFutureProvider._internal(
        (ref) => create(ref as ShoppingSheetFutureRef),
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
  AutoDisposeFutureProviderElement<ShoppingSheet?> createElement() {
    return _ShoppingSheetFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingSheetFutureProvider &&
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
mixin ShoppingSheetFutureRef on AutoDisposeFutureProviderRef<ShoppingSheet?> {
  /// The parameter `shoppingSheetId` of this provider.
  String get shoppingSheetId;
}

class _ShoppingSheetFutureProviderElement
    extends AutoDisposeFutureProviderElement<ShoppingSheet?>
    with ShoppingSheetFutureRef {
  _ShoppingSheetFutureProviderElement(super.provider);

  @override
  String get shoppingSheetId =>
      (origin as ShoppingSheetFutureProvider).shoppingSheetId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
