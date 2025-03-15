// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShoppingItem _$ShoppingItemFromJson(Map<String, dynamic> json) =>
    _ShoppingItem(
      name: json['name'] as String?,
      createdBy:
          json['createdBy'] == null
              ? const ShoppingItemCreateUser()
              : ShoppingItemCreateUser.fromJson(
                json['createdBy'] as Map<String, dynamic>,
              ),
      isCompleted: json['isCompleted'] as bool? ?? false,
      index: (json['index'] as num?)?.toInt(),
      id: json['id'] as String?,
      createdAt: FirestoreFieldConverter.nullableTimestampToDateTime(
        json['createdAt'],
      ),
      updatedAt: FirestoreFieldConverter.nullableTimestampToDateTime(
        json['updatedAt'],
      ),
    );

Map<String, dynamic> _$ShoppingItemToJson(_ShoppingItem instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      'createdBy': instance.createdBy.toJson(),
      'isCompleted': instance.isCompleted,
      if (instance.index case final value?) 'index': value,
      if (FirestoreFieldConverter.createdAtToJson(instance.createdAt)
          case final value?)
        'createdAt': value,
      if (FirestoreFieldConverter.updatedAtToJson(instance.updatedAt)
          case final value?)
        'updatedAt': value,
    };

_ShoppingItemCreateUser _$ShoppingItemCreateUserFromJson(
  Map<String, dynamic> json,
) => _ShoppingItemCreateUser(
  id: json['id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$ShoppingItemCreateUserToJson(
  _ShoppingItemCreateUser instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.name case final value?) 'name': value,
};
