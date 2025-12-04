// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingItemRepository)
const shoppingItemRepositoryProvider = ShoppingItemRepositoryProvider._();

final class ShoppingItemRepositoryProvider
    extends
        $FunctionalProvider<
          ShoppingItemRepository,
          ShoppingItemRepository,
          ShoppingItemRepository
        >
    with $Provider<ShoppingItemRepository> {
  const ShoppingItemRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingItemRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemRepositoryHash();

  @$internal
  @override
  $ProviderElement<ShoppingItemRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingItemRepository create(Ref ref) {
    return shoppingItemRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingItemRepository>(value),
    );
  }
}

String _$shoppingItemRepositoryHash() =>
    r'1b0c6f398642f873104d2390454fcc5483a5e333';

@ProviderFor(shoppingItemsStream)
const shoppingItemsStreamProvider = ShoppingItemsStreamFamily._();

final class ShoppingItemsStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShoppingItem>>,
          List<ShoppingItem>,
          Stream<List<ShoppingItem>>
        >
    with
        $FutureModifier<List<ShoppingItem>>,
        $StreamProvider<List<ShoppingItem>> {
  const ShoppingItemsStreamProvider._({
    required ShoppingItemsStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shoppingItemsStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemsStreamHash();

  @override
  String toString() {
    return r'shoppingItemsStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<ShoppingItem>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ShoppingItem>> create(Ref ref) {
    final argument = this.argument as String;
    return shoppingItemsStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemsStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingItemsStreamHash() =>
    r'63ff5c2478e1f03e3829a91ca3cbb0414b06b549';

final class ShoppingItemsStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<ShoppingItem>>, String> {
  const ShoppingItemsStreamFamily._()
    : super(
        retry: null,
        name: r'shoppingItemsStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppingItemsStreamProvider call(String shoppingSheetId) =>
      ShoppingItemsStreamProvider._(argument: shoppingSheetId, from: this);

  @override
  String toString() => r'shoppingItemsStreamProvider';
}

@ProviderFor(shoppingItemsFuture)
const shoppingItemsFutureProvider = ShoppingItemsFutureFamily._();

final class ShoppingItemsFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShoppingItem>>,
          List<ShoppingItem>,
          FutureOr<List<ShoppingItem>>
        >
    with
        $FutureModifier<List<ShoppingItem>>,
        $FutureProvider<List<ShoppingItem>> {
  const ShoppingItemsFutureProvider._({
    required ShoppingItemsFutureFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shoppingItemsFutureProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemsFutureHash();

  @override
  String toString() {
    return r'shoppingItemsFutureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ShoppingItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShoppingItem>> create(Ref ref) {
    final argument = this.argument as String;
    return shoppingItemsFuture(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemsFutureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingItemsFutureHash() =>
    r'5b67b53ffc827b1ed1434c2555b8fdf6a5e64c72';

final class ShoppingItemsFutureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ShoppingItem>>, String> {
  const ShoppingItemsFutureFamily._()
    : super(
        retry: null,
        name: r'shoppingItemsFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppingItemsFutureProvider call(String shoppingSheetId) =>
      ShoppingItemsFutureProvider._(argument: shoppingSheetId, from: this);

  @override
  String toString() => r'shoppingItemsFutureProvider';
}

@ProviderFor(isAnyCompletedShoppingItemExistsStream)
const isAnyCompletedShoppingItemExistsStreamProvider =
    IsAnyCompletedShoppingItemExistsStreamFamily._();

final class IsAnyCompletedShoppingItemExistsStreamProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const IsAnyCompletedShoppingItemExistsStreamProvider._({
    required IsAnyCompletedShoppingItemExistsStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isAnyCompletedShoppingItemExistsStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$isAnyCompletedShoppingItemExistsStreamHash();

  @override
  String toString() {
    return r'isAnyCompletedShoppingItemExistsStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isAnyCompletedShoppingItemExistsStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsAnyCompletedShoppingItemExistsStreamProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isAnyCompletedShoppingItemExistsStreamHash() =>
    r'a611e06b83a29f19f925e66e30780ff173286bf2';

final class IsAnyCompletedShoppingItemExistsStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<bool>, String> {
  const IsAnyCompletedShoppingItemExistsStreamFamily._()
    : super(
        retry: null,
        name: r'isAnyCompletedShoppingItemExistsStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsAnyCompletedShoppingItemExistsStreamProvider call(String shoppingSheetId) =>
      IsAnyCompletedShoppingItemExistsStreamProvider._(
        argument: shoppingSheetId,
        from: this,
      );

  @override
  String toString() => r'isAnyCompletedShoppingItemExistsStreamProvider';
}
