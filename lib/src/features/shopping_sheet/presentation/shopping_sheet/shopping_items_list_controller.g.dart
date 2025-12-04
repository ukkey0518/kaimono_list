// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_items_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingItemsListController)
const shoppingItemsListControllerProvider =
    ShoppingItemsListControllerProvider._();

final class ShoppingItemsListControllerProvider
    extends $AsyncNotifierProvider<ShoppingItemsListController, void> {
  const ShoppingItemsListControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingItemsListControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemsListControllerHash();

  @$internal
  @override
  ShoppingItemsListController create() => ShoppingItemsListController();
}

String _$shoppingItemsListControllerHash() =>
    r'497adb1a604ae8c647a2fb14e59de204b2dda6e0';

abstract class _$ShoppingItemsListController extends $AsyncNotifier<void> {
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
