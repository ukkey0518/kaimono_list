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
        .orderBy('createdAt')
        .snapshots()
        .map((qs) => qs.docs.map((ds) => ds.data()).toList());
  }

  Future<String> createItem(Item item) async {
    final ref = await itemsRef().add(item);
    return ref.id;
  }

  Future<void> updateItem(Item item) async {
    await itemRef(item.id!).set(
      item,
      SetOptions(merge: true),
    );
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
