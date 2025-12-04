// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingSheetRepository)
const shoppingSheetRepositoryProvider = ShoppingSheetRepositoryProvider._();

final class ShoppingSheetRepositoryProvider
    extends
        $FunctionalProvider<
          ShoppingSheetRepository,
          ShoppingSheetRepository,
          ShoppingSheetRepository
        >
    with $Provider<ShoppingSheetRepository> {
  const ShoppingSheetRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingSheetRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingSheetRepositoryHash();

  @$internal
  @override
  $ProviderElement<ShoppingSheetRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingSheetRepository create(Ref ref) {
    return shoppingSheetRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingSheetRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingSheetRepository>(value),
    );
  }
}

String _$shoppingSheetRepositoryHash() =>
    r'0bc0b777cc3b1b55ed691371e751aecbce71df86';

@ProviderFor(shoppingSheetsByUserFuture)
const shoppingSheetsByUserFutureProvider =
    ShoppingSheetsByUserFutureProvider._();

final class ShoppingSheetsByUserFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShoppingSheet>>,
          List<ShoppingSheet>,
          FutureOr<List<ShoppingSheet>>
        >
    with
        $FutureModifier<List<ShoppingSheet>>,
        $FutureProvider<List<ShoppingSheet>> {
  const ShoppingSheetsByUserFutureProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingSheetsByUserFutureProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingSheetsByUserFutureHash();

  @$internal
  @override
  $FutureProviderElement<List<ShoppingSheet>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShoppingSheet>> create(Ref ref) {
    return shoppingSheetsByUserFuture(ref);
  }
}

String _$shoppingSheetsByUserFutureHash() =>
    r'2f6128ae47e3213ba5bae8c529e368b3994a4507';

@ProviderFor(shoppingSheetFuture)
const shoppingSheetFutureProvider = ShoppingSheetFutureFamily._();

final class ShoppingSheetFutureProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShoppingSheet?>,
          ShoppingSheet?,
          FutureOr<ShoppingSheet?>
        >
    with $FutureModifier<ShoppingSheet?>, $FutureProvider<ShoppingSheet?> {
  const ShoppingSheetFutureProvider._({
    required ShoppingSheetFutureFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shoppingSheetFutureProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingSheetFutureHash();

  @override
  String toString() {
    return r'shoppingSheetFutureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ShoppingSheet?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShoppingSheet?> create(Ref ref) {
    final argument = this.argument as String;
    return shoppingSheetFuture(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingSheetFutureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingSheetFutureHash() =>
    r'51534673be4a021b4d022fbb0b5101e694c576c9';

final class ShoppingSheetFutureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ShoppingSheet?>, String> {
  const ShoppingSheetFutureFamily._()
    : super(
        retry: null,
        name: r'shoppingSheetFutureProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppingSheetFutureProvider call(String shoppingSheetId) =>
      ShoppingSheetFutureProvider._(argument: shoppingSheetId, from: this);

  @override
  String toString() => r'shoppingSheetFutureProvider';
}
