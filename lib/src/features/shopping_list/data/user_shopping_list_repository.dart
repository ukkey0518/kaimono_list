import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/user_shopping_list.dart';
import 'package:kaimono_list/src/utils/extensions/firestore_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_shopping_list_repository.g.dart';

class UserShoppingListRepository {
  const UserShoppingListRepository(this._firestore);

  final FirebaseFirestore _firestore;

  // ------------------------------------------------------------------------ //

  static String userShoppingListsPath(String userId) =>
      '/user_profiles/$userId/user_shopping_lists';

  static String userShoppingListPath(String userId, String shoppingListId) =>
      '${userShoppingListsPath(userId)}/$shoppingListId';

  CollectionReference<UserShoppingList> userShoppingListsRef(String userId) {
    return _firestore.collection(userShoppingListsPath(userId)).withConverter(
          fromFirestore: (ds, _) {
            return UserShoppingList.fromJson(ds.toModelData()!);
          },
          toFirestore: (userShoppingList, _) => userShoppingList.toJson(),
        );
  }

  DocumentReference<UserShoppingList> userShoppingListRef(
    String userId,
    String shoppingListId,
  ) {
    return _firestore
        .doc(userShoppingListPath(userId, shoppingListId))
        .withConverter(
          fromFirestore: (ds, _) {
            return UserShoppingList.fromJson(ds.toModelData()!);
          },
          toFirestore: (userShoppingList, _) => userShoppingList.toJson(),
        );
  }

  // ------------------------------------------------------------------------ //

  Stream<List<UserShoppingList>> watchUserShoppingLists(String userId) {
    return userShoppingListsRef(userId)
        .orderBy('orderIndex', descending: true)
        .snapshots()
        .map((qs) => qs.docs.map((ds) => ds.data()).toList());
  }
}

@Riverpod(
  dependencies: [],
)
UserShoppingListRepository userShoppingListRepository(
  UserShoppingListRepositoryRef ref,
) {
  return UserShoppingListRepository(FirebaseFirestore.instance);
}

@Riverpod(
  dependencies: [
    currentUserStream,
    userShoppingListRepository,
  ],
)
Stream<List<UserShoppingList>> userShoppingListsStream(
  UserShoppingListsStreamRef ref,
) {
  final appUser = ref.watch(currentUserStreamProvider).value;
  if (appUser == null) {
    return Stream.value([]);
  }
  final userShoppingListRepository = ref.watch(
    userShoppingListRepositoryProvider,
  );
  return userShoppingListRepository.watchUserShoppingLists(appUser.id);
}
