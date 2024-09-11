import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaimono_list/src/features/item/domain/item.dart';
import 'package:kaimono_list/src/utils/extensions/firestore_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_repository.g.dart';

class ItemRepository {
  const ItemRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String itemsPath() => 'items';
  static String itemPath(String id) => '${itemsPath()}/$id';

  CollectionReference<Item> itemsRef() {
    return _firestore.collection(itemsPath()).withConverter(
          fromFirestore: (ds, _) => Item.fromJson(ds.toModelData()!),
          toFirestore: (item, _) => item.toJson(),
        );
  }

  DocumentReference<Item> itemRef(String id) {
    return _firestore.doc(itemPath(id)).withConverter(
          fromFirestore: (ds, _) => Item.fromJson(ds.toModelData()!),
          toFirestore: (item, _) => item.toJson(),
        );
  }

  Stream<List<Item>> watchItemsList() {
    return itemsRef()
        .orderBy('orderIndex')
        .snapshots()
        .map((qs) => qs.docs.map((ds) => ds.data()).toList());
  }

  Future<String> createItem(Item item) async {
    final maxOrderIndex = await itemsRef()
        .orderBy('orderIndex', descending: true)
        .limit(1)
        .get()
        .then((qs) => qs.docs.firstOrNull?.data().orderIndex);
    final newOrderIndex = maxOrderIndex == null ? 0 : maxOrderIndex + 1;
    final ref = await itemsRef().add(
      item.copyWith(orderIndex: newOrderIndex),
    );
    return ref.id;
  }

  Future<void> updateItem(Item item) async {
    await itemRef(item.id!).set(
      item,
      SetOptions(merge: true),
    );
  }

  Future<void> updateOrderIndexes(List<Item> items) async {
    final batch = _firestore.batch();
    for (final (index, item) in items.indexed) {
      batch.update(itemRef(item.id!), {'orderIndex': index});
    }
    await batch.commit();
  }

  Future<void> deleteItem(String id) async {
    await itemRef(id).delete();
  }

  Future<void> deleteAllPurchasedItems() async {
    final batch = _firestore.batch();
    final purchasedItems = await itemsRef()
        .where('isPurchased', isEqualTo: true)
        .get()
        .then((qs) => qs.docs.map((ds) => ds.reference).toList());

    for (final itemRef in purchasedItems) {
      batch.delete(itemRef);
    }

    await batch.commit();
  }
}

@Riverpod(
  dependencies: [],
)
ItemRepository itemRepository(ItemRepositoryRef ref) {
  return ItemRepository(FirebaseFirestore.instance);
}

@Riverpod(
  dependencies: [
    itemRepository,
  ],
)
Stream<List<Item>> itemsListStream(ItemsListStreamRef ref) {
  final itemRepository = ref.read(itemRepositoryProvider);
  return itemRepository.watchItemsList();
}
