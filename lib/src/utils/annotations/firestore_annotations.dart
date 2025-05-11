import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Annotation for Firestore model.
const firestoreModel = JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
);

/// Json key for Firestore document ID.
const firestoreId = JsonKey(includeToJson: false);

/// Json key for Firestore created at timestamp.
const firestoreCreatedAt = JsonKey(
  name: 'createdAt',
  includeIfNull: false,
  fromJson: FirestoreFieldConverter.nullableTimestampToDateTime,
  toJson: FirestoreFieldConverter.createdAtToJson,
);

/// Json key for Firestore updated at timestamp.
const firestoreUpdatedAt = JsonKey(
  name: 'updatedAt',
  includeIfNull: false,
  fromJson: FirestoreFieldConverter.nullableTimestampToDateTime,
  toJson: FirestoreFieldConverter.updatedAtToJson,
);

/// Firestore timestamp converter.
class FirestoreTimestamp implements JsonConverter<DateTime, dynamic> {
  const FirestoreTimestamp();

  @override
  DateTime fromJson(dynamic timestamp) {
    return FirestoreFieldConverter.timestampToDateTime(timestamp);
  }

  @override
  dynamic toJson(DateTime dateTime) {
    return FirestoreFieldConverter.timestampToJson(dateTime);
  }
}

/// Firestore nullable timestamp converter.
class FirestoreTimestampN implements JsonConverter<DateTime?, dynamic> {
  const FirestoreTimestampN();

  @override
  DateTime? fromJson(dynamic timestamp) {
    return FirestoreFieldConverter.nullableTimestampToDateTime(timestamp);
  }

  @override
  dynamic toJson(DateTime? dateTime) {
    return FirestoreFieldConverter.nullableTimestampToJson(dateTime);
  }
}

/// Firestore field converter.
final class FirestoreFieldConverter {
  const FirestoreFieldConverter._();

  /// Firestore timestamp converter.
  static DateTime timestampToDateTime(dynamic timestamp) {
    if (timestamp is DateTime) return timestamp;
    if (timestamp is Timestamp) return timestamp.toDate();
    throw ArgumentError.value(timestamp, 'timestamp', 'Invalid timestamp');
  }

  /// Firestore nullable timestamp converter.
  static DateTime? nullableTimestampToDateTime(dynamic timestamp) {
    if (timestamp == null) return null;
    if (timestamp is DateTime) return timestamp;
    if (timestamp is Timestamp) return timestamp.toDate();
    throw ArgumentError.value(timestamp, 'timestamp', 'Invalid timestamp');
  }

  /// Firestore timestamp to JSON converter.
  static dynamic timestampToJson(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }

  /// Firestore nullable timestamp to JSON converter.
  static dynamic nullableTimestampToJson(DateTime? dateTime) {
    return dateTime == null ? null : Timestamp.fromDate(dateTime);
  }

  /// Firestore created at to JSON converter.
  static dynamic createdAtToJson(DateTime? dateTime) {
    return dateTime == null ? FieldValue.serverTimestamp() : null;
  }

  /// Firestore updated at to JSON converter.
  static dynamic updatedAtToJson(DateTime? dateTime) {
    return FieldValue.serverTimestamp();
  }
}
