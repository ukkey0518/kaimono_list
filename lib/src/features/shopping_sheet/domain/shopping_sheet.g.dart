// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShoppingSheet _$ShoppingSheetFromJson(Map<String, dynamic> json) =>
    _ShoppingSheet(
      title: json['title'] as String?,
      ownerUserId: json['ownerUserId'] as String?,
      memberUserIds:
          (json['memberUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
        json['createdAt'],
      ),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
        json['updatedAt'],
      ),
    );

Map<String, dynamic> _$ShoppingSheetToJson(_ShoppingSheet instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.ownerUserId case final value?) 'ownerUserId': value,
      'memberUserIds': instance.memberUserIds,
      if (FirestoreFieldConverter.createdAtToJson(instance.createdAt)
          case final value?)
        'createdAt': value,
      if (FirestoreFieldConverter.updatedAtToJson(instance.updatedAt)
          case final value?)
        'updatedAt': value,
    };
