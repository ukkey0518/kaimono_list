// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingItemImpl _$$ShoppingItemImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingItemImpl(
      orderIndex: (json['orderIndex'] as num?)?.toInt(),
      name: json['name'] as String?,
      isPurchased: json['isPurchased'] as bool? ?? false,
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['createdAt']),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['updatedAt']),
    );

Map<String, dynamic> _$$ShoppingItemImplToJson(_$ShoppingItemImpl instance) =>
    <String, dynamic>{
      if (instance.orderIndex case final value?) 'orderIndex': value,
      if (instance.name case final value?) 'name': value,
      if (instance.isPurchased case final value?) 'isPurchased': value,
      if (FirestoreFieldConverter.createdAtToJson(instance.createdAt)
          case final value?)
        'createdAt': value,
      if (FirestoreFieldConverter.updatedAtToJson(instance.updatedAt)
          case final value?)
        'updatedAt': value,
    };
