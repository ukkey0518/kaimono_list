// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingSheetEditController)
const shoppingSheetEditControllerProvider =
    ShoppingSheetEditControllerProvider._();

final class ShoppingSheetEditControllerProvider
    extends $AsyncNotifierProvider<ShoppingSheetEditController, void> {
  const ShoppingSheetEditControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingSheetEditControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingSheetEditControllerHash();

  @$internal
  @override
  ShoppingSheetEditController create() => ShoppingSheetEditController();
}

String _$shoppingSheetEditControllerHash() =>
    r'eb4e715badf9619a546cc57b59c41dd0668f29b0';

abstract class _$ShoppingSheetEditController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
