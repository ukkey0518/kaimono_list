import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';

part 'user_shopping_list_setting.freezed.dart';
part 'user_shopping_list_setting.g.dart';

@freezed
class UserShoppingListSetting with _$UserShoppingListSetting {
  @firestoreModel
  const factory UserShoppingListSetting({
    required List<UserShoppingList> userShoppingLists,
    @firestoreId String? id,
    @firestoreCreatedAt DateTime? createdAt,
    @firestoreUpdatedAt DateTime? updatedAt,
  }) = _UserShoppingListSetting;

  factory UserShoppingListSetting.fromJson(Map<String, dynamic> json) =>
      _$UserShoppingListSettingFromJson(json);

  const UserShoppingListSetting._();
}

@freezed
class UserShoppingList with _$UserShoppingList {
  @firestoreModel
  const factory UserShoppingList({
    required String id,
    required String name,
  }) = _UserShoppingList;

  factory UserShoppingList.fromJson(Map<String, dynamic> json) =>
      _$UserShoppingListFromJson(json);

  const UserShoppingList._();
}
