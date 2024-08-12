import 'package:kaimono_list/src/features/item/data/item_repository.dart';
import 'package:kaimono_list/src/features/item/domain/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_list_controller.g.dart';

@Riverpod(
  dependencies: [
    itemRepository,
  ],
)
class ItemListController extends _$ItemListController {
  @override
  FutureOr<void> build() => null;

  /// Create a new item with the given [name].
  Future<bool> addItem(String name) async {
    final itemRepository = ref.read(itemRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await itemRepository.createItem(
        Item(
          name: name,
        ),
      );
    });
    return state.hasError;
  }

  /// Update the given [item].
  Future<bool> updateItem(Item item) async {
    final itemRepository = ref.read(itemRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await itemRepository.updateItem(item);
    });
    return state.hasError;
  }

  /// Delete the item with the given [id].
  Future<bool> deleteItem(String id) async {
    final itemRepository = ref.read(itemRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await itemRepository.deleteItem(id);
    });
    return state.hasError;
  }

  /// Delete all purchased items.
  Future<bool> deleteAllPurchasedItems() async {
    final itemRepository = ref.read(itemRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await itemRepository.deleteAllPurchasedItems();
    });
    return state.hasError;
  }
}
