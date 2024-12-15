import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/shopping_sheet/domain/shopping_sheet.dart';
import 'package:kaimono_list/src/utils/extensions/firestore_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_sheet_repository.g.dart';

class ShoppingSheetRepository {
  const ShoppingSheetRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String collectionPath() {
    return 'shopping_sheets';
  }

  static String documentPath(String shoppingSheetId) {
    return '${collectionPath()}/$shoppingSheetId';
  }

  CollectionReference<ShoppingSheet> collectionRef() {
    return _firestore.collection(collectionPath()).withConverter(
          fromFirestore: (ds, _) => ShoppingSheet.fromJson(ds.toModelJson()!),
          toFirestore: (shoppingSheet, _) => shoppingSheet.toJson(),
        );
  }

  DocumentReference<ShoppingSheet> documentRef(
    String shoppingSheetId,
  ) {
    return _firestore.doc(documentPath(shoppingSheetId)).withConverter(
          fromFirestore: (ds, _) => ShoppingSheet.fromJson(ds.toModelJson()!),
          toFirestore: (shoppingSheet, _) => shoppingSheet.toJson(),
        );
  }

  Future<List<ShoppingSheet>> fetchListByUser({
    required String userId,
  }) async {
    final query = collectionRef()
        .where(
          Filter.or(
            // The user is the owner of the shopping sheet.
            Filter('ownerUserId', isEqualTo: userId),
            // The user is a member of the shopping sheet.
            Filter('memberUserIds', arrayContains: userId),
          ),
        )
        .orderBy('updatedAt', descending: false);
    final qs = await query.get();
    return qs.docs.map((ds) => ds.data()).toList();
  }

  Future<ShoppingSheet?> fetchById({
    required String shoppingSheetId,
  }) async {
    final doc = await documentRef(shoppingSheetId).get();
    return doc.data();
  }

  Future<String> create({
    required ShoppingSheet shoppingSheet,
  }) async {
    final doc = await collectionRef().add(shoppingSheet);
    return doc.id;
  }

  Future<void> updateTitle({
    required String shoppingSheetId,
    required String title,
  }) async {
    await documentRef(shoppingSheetId).update({'title': title});
  }

  Future<void> delete({
    required String shoppingSheetId,
  }) async {
    await documentRef(shoppingSheetId).delete();
  }

  Future<bool> canAccess(String shoppingSheetId) async {
    try {
      final ds = await documentRef(shoppingSheetId).get();
      return ds.exists;
    } catch (e) {
      return false;
    }
  }
}

@Riverpod(dependencies: [])
ShoppingSheetRepository shoppingSheetRepository(Ref ref) {
  return ShoppingSheetRepository(FirebaseFirestore.instance);
}

@Riverpod(
  dependencies: [
    currentUserStream,
    shoppingSheetRepository,
  ],
)
Future<List<ShoppingSheet>> shoppingSheetsByUserFuture(Ref ref) async {
  final currentUser = await ref.watch(currentUserStreamProvider.future);
  if (currentUser == null) {
    return [];
  }

  final shoppingSheetRepository = ref.watch(shoppingSheetRepositoryProvider);
  return shoppingSheetRepository.fetchListByUser(userId: currentUser.id);
}

@Riverpod(
  dependencies: [
    shoppingSheetRepository,
  ],
)
Future<ShoppingSheet?> shoppingSheetFuture(
  Ref ref,
  String shoppingSheetId,
) async {
  final repository = ref.watch(shoppingSheetRepositoryProvider);
  return repository.fetchById(
    shoppingSheetId: shoppingSheetId,
  );
}
