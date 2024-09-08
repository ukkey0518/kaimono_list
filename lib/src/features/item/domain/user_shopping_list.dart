import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';

part 'user_shopping_list.freezed.dart';
part 'user_shopping_list.g.dart';

@freezed
class UserShoppingList with _$UserShoppingList {
  @firestoreModel
  const factory UserShoppingList({
    required String orderIndex,
    @firestoreId String? id,
  }) = _UserShoppingList;

  factory UserShoppingList.fromJson(Map<String, dynamic> json) =>
      _$UserShoppingListFromJson(json);

  const UserShoppingList._();
}
