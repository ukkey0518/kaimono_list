// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_shopping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserShoppingListImpl _$$UserShoppingListImplFromJson(
        Map<String, dynamic> json) =>
    _$UserShoppingListImpl(
      orderIndex: (json['orderIndex'] as num).toInt(),
      name: json['name'] as String?,
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['createdAt']),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['updatedAt']),
    );

Map<String, dynamic> _$$UserShoppingListImplToJson(
    _$UserShoppingListImpl instance) {
  final val = <String, dynamic>{
    'orderIndex': instance.orderIndex,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull(
      'createdAt', FirestoreFieldConverter.createdAtToJson(instance.createdAt));
  writeNotNull(
      'updatedAt', FirestoreFieldConverter.updatedAtToJson(instance.updatedAt));
  return val;
}
