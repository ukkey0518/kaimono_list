// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingSheetListController)
const shoppingSheetListControllerProvider =
    ShoppingSheetListControllerProvider._();

final class ShoppingSheetListControllerProvider
    extends $AsyncNotifierProvider<ShoppingSheetListController, void> {
  const ShoppingSheetListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingSheetListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingSheetListControllerHash();

  @$internal
  @override
  ShoppingSheetListController create() => ShoppingSheetListController();
}

String _$shoppingSheetListControllerHash() =>
    r'8c49964bc33e2230d1cdfffb63b47f72ecf00656';

abstract class _$ShoppingSheetListController extends $AsyncNotifier<void> {
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
