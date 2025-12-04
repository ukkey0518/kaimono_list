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
      'title': ?instance.title,
      'ownerUserId': ?instance.ownerUserId,
      'memberUserIds': instance.memberUserIds,
      'createdAt': ?FirestoreFieldConverter.createdAtToJson(instance.createdAt),
      'updatedAt': ?FirestoreFieldConverter.updatedAtToJson(instance.updatedAt),
    };
