import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kaimono_list/src/features/item/domain/user_shopping_list_setting.dart';
import 'package:kaimono_list/src/utils/extensions/firestore_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_shopping_list_setting_repository.g.dart';

class UserShoppingListSettingRepository {
  const UserShoppingListSettingRepository(this._firestore);

  final FirebaseFirestore _firestore;

  // ------------------------------------------------------------------------ //

  static String userShoppingListSettingsPath() => 'user_shopping_list_settings';

  static String userShoppingListSettingPath(String userId) =>
      '${userShoppingListSettingsPath()}/$userId';

  CollectionReference<UserShoppingListSetting> userShoppingListSettingsRef() {
    return _firestore.collection(userShoppingListSettingsPath()).withConverter(
      fromFirestore: (ds, _) {
        return UserShoppingListSetting.fromJson(ds.toModelData()!);
      },
      toFirestore: (userShoppingListSetting, _) {
        return userShoppingListSetting.toJson();
      },
    );
  }

  DocumentReference<UserShoppingListSetting> userShoppingListSettingRef(
    String userId,
  ) {
    return _firestore.doc(userShoppingListSettingPath(userId)).withConverter(
      fromFirestore: (ds, _) {
        return UserShoppingListSetting.fromJson(ds.toModelData()!);
      },
      toFirestore: (userShoppingListSetting, _) {
        return userShoppingListSetting.toJson();
      },
    );
  }

  // ------------------------------------------------------------------------ //

  Stream<List<UserShoppingList>> watchUserShoppingLists(
    String? userId,
  ) {
    return userShoppingListSettingRef(userId!)
        .snapshots()
        .map((ds) => ds.data()?.userShoppingLists ?? <UserShoppingList>[]);
  }

  /// Reorders user shopping lists according to a specified order,
  /// ensuring consistency and preventing mismatched operations.
  Future<void> reorderUserShoppingLists(
    String userId,
    List<String> sortedUserShoppingListIds,
  ) async {
    await _firestore.runTransaction((transaction) async {
      final settingDS = await userShoppingListSettingRef(userId).get();
      final setting = settingDS.data();

      if (setting == null) {
        // TODO: Throw UserShoppingListSettingNotFoundException
        throw Exception('UserShoppingListSetting not found');
      }

      // Checking if current and new sorted IDs match.
      // * this ensures the lists are consistent and prevents mismatched
      // * reorder operations.
      final currentIds = setting.userShoppingLists.map((e) => e.id).toSet();
      final newIds = sortedUserShoppingListIds.toSet();
      if (!setEquals(currentIds, newIds)) {
        // TODO: Throw UserShoppingListSettingIdsMismatchException
        throw Exception('The order of the shopping lists is the same');
      }

      // * Reorders the shopping lists according to the user-specified order
      // * without affecting the contents or data of each list.
      final reorderedLists = sortedUserShoppingListIds.map((listId) {
        return setting.userShoppingLists.firstWhere((list) {
          return list.id == listId;
        });
      });

      transaction.update(userShoppingListSettingRef(userId), {
        'userShoppingLists': reorderedLists,
      });
    });
  }
}

@Riverpod(
  dependencies: [],
)
UserShoppingListSettingRepository userShoppingListSettingRepository(
  UserShoppingListSettingRepositoryRef ref,
) {
  return UserShoppingListSettingRepository(FirebaseFirestore.instance);
}

@Riverpod(
  dependencies: [
    userShoppingListSettingRepository,
  ],
)
Stream<List<UserShoppingList>> userShoppingListsStream(
  UserShoppingListsStreamRef ref,
  String userId,
) {
  final userShoppingListSettingRepository =
      ref.read(userShoppingListSettingRepositoryProvider);

  return userShoppingListSettingRepository.watchUserShoppingLists(userId);
}
