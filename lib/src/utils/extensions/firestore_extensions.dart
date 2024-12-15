import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaimono_list/src/utils/json.dart';

extension ModelDocumentSnapshotEx on DocumentSnapshot<Json> {
  /// Convert the document snapshot to a model data.
  Json? toModelJson() {
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
