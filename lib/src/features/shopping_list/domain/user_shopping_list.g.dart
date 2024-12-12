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
      ownerUserId: json['ownerUserId'] as String?,
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['createdAt']),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
          json['updatedAt']),
    );

Map<String, dynamic> _$$UserShoppingListImplToJson(
        _$UserShoppingListImpl instance) =>
    <String, dynamic>{
      'orderIndex': instance.orderIndex,
      if (instance.name case final value?) 'name': value,
      if (instance.ownerUserId case final value?) 'ownerUserId': value,
      if (FirestoreFieldConverter.createdAtToJson(instance.createdAt)
          case final value?)
        'createdAt': value,
      if (FirestoreFieldConverter.updatedAtToJson(instance.updatedAt)
          case final value?)
        'updatedAt': value,
    };
