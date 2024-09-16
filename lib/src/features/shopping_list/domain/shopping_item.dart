import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';
import 'package:kaimono_list/src/utils/types/validatable_model.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
class ShoppingItem with _$ShoppingItem implements ValidatableModel {
  @firestoreModel
  const factory ShoppingItem({
    String? name,
    @Default(false) bool isPurchased,
    @firestoreId String? id,
    @firestoreCreatedAt DateTime? createdAt,
    @firestoreUpdatedAt DateTime? updatedAt,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);

  const ShoppingItem._();

  static int get maxNameLength => 20;

  @override
  String? validateForCreate() {
    final name = this.name;

    if (id != null) {
      return '`id` must be null.';
    }
    if (name == null || name.isEmpty) {
      return '`name` is required.';
    }
    if (name.length > maxNameLength) {
      return '`name` must be at most $maxNameLength characters.';
    }
    if (isPurchased) {
      return '`isPurchased` must be false.';
    }
    return null;
  }
}
