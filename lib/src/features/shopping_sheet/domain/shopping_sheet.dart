import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kaimono_list/src/utils/annotations/firestore_annotations.dart';

part 'shopping_sheet.freezed.dart';
part 'shopping_sheet.g.dart';

/// A class representing a shopping sheet.
@freezed
class ShoppingSheet with _$ShoppingSheet {
  @firestoreModel
  const factory ShoppingSheet({
    /// The title of the shopping sheet.
    String? title,

    /// The user ID of the owner of the shopping sheet.
    ///
    /// - The owner is the creator of the shopping sheet and can view, edit,
    ///   and delete the shopping sheet.
    String? ownerUserId,

    /// The user IDs of the members of the shopping sheet.
    ///
    /// - Members are added by the owner and can view and edit the shopping
    ///   sheet.
    @Default([]) List<String> memberUserIds,

    /// The ID of the shopping sheet.
    @firestoreId String? id,

    /// The date and time the shopping sheet was created.
    @firestoreCreatedAt DateTime? createdAt,

    /// The date and time the shopping sheet was last updated.
    @firestoreUpdatedAt DateTime? updatedAt,
  }) = _ShoppingSheet;

  factory ShoppingSheet.fromJson(Map<String, dynamic> json) =>
      _$ShoppingSheetFromJson(json);

  const ShoppingSheet._();

  static const maxTitleLength = 20;
}
