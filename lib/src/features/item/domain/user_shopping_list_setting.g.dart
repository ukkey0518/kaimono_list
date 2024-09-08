// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_shopping_list_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserShoppingListSettingImpl _$$UserShoppingListSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$UserShoppingListSettingImpl(
      userShoppingLists: (json['userShoppingLists'] as List<dynamic>)
          .map((e) => UserShoppingList.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$UserShoppingListSettingImplToJson(
        _$UserShoppingListSettingImpl instance) =>
    <String, dynamic>{
      'userShoppingLists':
          instance.userShoppingLists.map((e) => e.toJson()).toList(),
    };

_$UserShoppingListImpl _$$UserShoppingListImplFromJson(
        Map<String, dynamic> json) =>
    _$UserShoppingListImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserShoppingListImplToJson(
        _$UserShoppingListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
