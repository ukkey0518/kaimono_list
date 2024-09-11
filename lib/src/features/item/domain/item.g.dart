// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      name: json['name'] as String,
      isPurchased: json['isPurchased'] as bool? ?? false,
      orderIndex: (json['orderIndex'] as num?)?.toInt() ?? 0,
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['createdAt']),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['updatedAt']),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'isPurchased': instance.isPurchased,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('orderIndex', instance.orderIndex);
  writeNotNull(
      'createdAt', FirestoreFieldConverter.createdAtToJson(instance.createdAt));
  writeNotNull(
      'updatedAt', FirestoreFieldConverter.updatedAtToJson(instance.updatedAt));
  return val;
}
