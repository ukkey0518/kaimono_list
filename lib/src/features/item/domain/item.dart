import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  @firestoreModel
  const factory Item({
    required String name,
    @Default(false) bool isPurchased,
    @firestoreId String? id,
    @firestoreCreatedAt DateTime? createdAt,
    @firestoreUpdatedAt DateTime? updatedAt,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  const Item._();
}
