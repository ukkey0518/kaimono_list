import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/shopping_list.dart';
import 'package:kaimono_list/src/utils/extensions/firestore_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_list_repository.g.dart';

class ShoppingListRepository {
  const ShoppingListRepository(this._firestore);

  final FirebaseFirestore _firestore;

  // ------------------------------------------------------------------------ //

  static String shoppingListsPath() => 'shopping_lists';

  static String shoppingListPath(String id) => '${shoppingListsPath()}/$id';

  CollectionReference<ShoppingList> shoppingListsRef() {
    return _firestore.collection(shoppingListsPath()).withConverter(
          fromFirestore: (ds, _) => ShoppingList.fromJson(ds.toModelData()!),
          toFirestore: (shoppingList, _) => shoppingList.toJson(),
        );
  }

  DocumentReference<ShoppingList> shoppingListRef(String id) {
    return _firestore.doc(shoppingListPath(id)).withConverter(
          fromFirestore: (ds, _) => ShoppingList.fromJson(ds.toModelData()!),
          toFirestore: (shoppingList, _) => shoppingList.toJson(),
        );
  }

  // ------------------------------------------------------------------------ //

  Future<String> createShoppingList(ShoppingList shoppingList) async {
    final ref = await shoppingListsRef().add(shoppingList);
    return ref.id;
  }

  Future<void> updateShoppingList(ShoppingList shoppingList) async {
    await shoppingListRef(shoppingList.id!).set(
      shoppingList,
      SetOptions(merge: true),
    );
  }
}

@Riverpod(
  dependencies: [],
)
ShoppingListRepository shoppingListRepository(ShoppingListRepositoryRef ref) {
  return ShoppingListRepository(FirebaseFirestore.instance);
}
