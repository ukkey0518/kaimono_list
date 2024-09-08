import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  @firestoreModel
  const factory ShoppingItem({
    required String name,
    @Default(false) bool isPurchased,
    @firestoreId String? id,
    @firestoreCreatedAt DateTime? createdAt,
    @firestoreUpdatedAt DateTime? updatedAt,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);

  const ShoppingItem._();
}
