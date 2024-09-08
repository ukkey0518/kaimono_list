// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingItemImpl _$$ShoppingItemImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingItemImpl(
      name: json['name'] as String,
      isPurchased: json['isPurchased'] as bool? ?? false,
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['createdAt']),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['updatedAt']),
    );

Map<String, dynamic> _$$ShoppingItemImplToJson(_$ShoppingItemImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'isPurchased': instance.isPurchased,
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
