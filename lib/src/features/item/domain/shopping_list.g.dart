// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingListImpl _$$ShoppingListImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingListImpl(
      name: json['name'] as String,
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['createdAt']),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['updatedAt']),
    );

Map<String, dynamic> _$$ShoppingListImplToJson(_$ShoppingListImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'createdAt', FirestoreFieldConverter.createdAtToJson(instance.createdAt));
  writeNotNull(
      'updatedAt', FirestoreFieldConverter.updatedAtToJson(instance.updatedAt));
  return val;
}
