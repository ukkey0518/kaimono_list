import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
abstract class ShoppingItem with _$ShoppingItem {
  @firestoreModel
  const factory ShoppingItem({
    /// The name of the shopping item.
    String? name,

    /// The user who created the shopping item.
    @Default(ShoppingItemCreateUser()) ShoppingItemCreateUser createdBy,

    /// Whether the shopping item is completed.
    @Default(false) bool isCompleted,

    /// The index of the shopping item.
    int? index,

    /// The ID of the shopping item.
    @firestoreId String? id,

    /// The date and time the shopping item was created.
    @firestoreCreatedAt DateTime? createdAt,

    /// The date and time the shopping item was last updated.
    @firestoreUpdatedAt DateTime? updatedAt,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);

  const ShoppingItem._();
}

@freezed
abstract class ShoppingItemCreateUser with _$ShoppingItemCreateUser {
  @firestoreModel
  const factory ShoppingItemCreateUser({
    /// The ID of the user who created the shopping item.
    String? id,

    /// The name of the user who created the shopping item.
    String? name,
  }) = _ShoppingItemCreateUser;

  factory ShoppingItemCreateUser.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemCreateUserFromJson(json);

  const ShoppingItemCreateUser._();
}
