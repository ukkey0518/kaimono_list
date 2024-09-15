import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/shopping_list/domain/user_shopping_list_setting.dart';
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

  Stream<UserShoppingListSetting?> watchUserShoppingListSetting(
    String userId,
  ) {
    return userShoppingListSettingRef(userId)
        .snapshots()
        .map((ds) => ds.data());
  }

  /// Reorders user shopping lists according to a specified order,
  /// ensuring consistency and preventing mismatched operations.
  Future<void> setUserShoppingListsOrder(
    String userId,
    List<String> sortedUserShoppingListIds,
  ) async {
    await _firestore.runTransaction((transaction) async {
      final settingDS = await userShoppingListSettingRef(userId).get();
      final setting = settingDS.data();

      if (setting == null) {
        // TODO(Ukkey): Throw UserShoppingListSettingNotFoundException
        throw Exception('UserShoppingListSetting not found');
      }

      // Checking if current and new sorted IDs match.
      // * this ensures the lists are consistent and prevents mismatched
      // * reorder operations.
      final currentIds = setting.userShoppingLists.map((e) => e.id).toSet();
      final newIds = sortedUserShoppingListIds.toSet();
      if (!setEquals(currentIds, newIds)) {
        // TODO(Ukkey): Throw UserShoppingListSettingIdsMismatchException
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
    authStateChangesStream,
    userShoppingListSettingRepository,
  ],
)
Stream<List<UserShoppingList>> userShoppingListsStream(
  UserShoppingListsStreamRef ref,
) {
  final user = ref.watch(authStateChangesStreamProvider).value;
  if (user == null) {
    return Stream.value([]);
  }
  final userShoppingListSettingRepository =
      ref.watch(userShoppingListSettingRepositoryProvider);

  return userShoppingListSettingRepository
      .watchUserShoppingListSetting(user.id)
      .map((setting) => setting?.userShoppingLists ?? []);
}
