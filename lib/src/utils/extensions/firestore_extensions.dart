import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaimono_list/src/utils/json.dart';

extension ModelDocumentSnapshotEx on DocumentSnapshot<Json> {
  /// Returns the document data with the document ID.
  Json? dataWithId() {
    final data = this.data();
    return data == null ? null : {'id': id, ...data};
  }
}
