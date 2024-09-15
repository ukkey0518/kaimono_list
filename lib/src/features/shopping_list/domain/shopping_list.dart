import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';
import 'package:kaimono_list/src/utils/types/validatable_model.dart';

part 'shopping_list.freezed.dart';
part 'shopping_list.g.dart';

@freezed
class ShoppingList with _$ShoppingList implements ValidatableModel {
  @firestoreModel
  const factory ShoppingList({
    required String name,
    String? ownerUserId,
    @firestoreId String? id,
    @firestoreCreatedAt DateTime? createdAt,
    @firestoreUpdatedAt DateTime? updatedAt,
  }) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);

  const ShoppingList._();

  static int get maxNameLength => 10;

  @override
  String? validateForCreate() {
    final name = this.name;
    final ownerUserId = this.ownerUserId;

    if (name.isEmpty) {
      return '`name` is required.';
    }
    if (name.length > maxNameLength) {
      return '`name` must be at most $maxNameLength characters.';
    }
    if (ownerUserId == null || ownerUserId.isEmpty) {
      return '`ownerUserId` is required.';
    }
    return null;
  }
}
