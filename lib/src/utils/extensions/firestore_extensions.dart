import 'package:cloud_firestore/cloud_firestore.dart';

extension ModelDocumentSnapshotEx on DocumentSnapshot<Map<String, dynamic>> {
  /// Convert the document snapshot to a model data.
  Map<String, dynamic>? toModelData() {
    final data = this.data();
    if (data == null) {
      return null;
    }
    return {
      'id': id,
      ...data,
    };
  }
}

extension ModelMapEx on Map<String, dynamic> {
  /// Convert the model data to a document data.
  Map<String, dynamic> toCreateData() {
    return {
      ...this,
    }
      ..['createdAt'] = FieldValue.serverTimestamp()
      ..['updatedAt'] = FieldValue.serverTimestamp();
  }

  /// Convert the model data to a document data.
  Map<String, dynamic> toUpdateData() {
    return {
      ...this,
    }..['updatedAt'] = FieldValue.serverTimestamp();
  }
}
