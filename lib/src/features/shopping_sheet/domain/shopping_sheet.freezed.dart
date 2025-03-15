// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingSheet {

/// The title of the shopping sheet.
 String? get title;/// The user ID of the owner of the shopping sheet.
///
/// - The owner is the creator of the shopping sheet and can view, edit,
///   and delete the shopping sheet.
 String? get ownerUserId;/// The user IDs of the members of the shopping sheet.
///
/// - Members are added by the owner and can view and edit the shopping
///   sheet.
 List<String> get memberUserIds;/// The ID of the shopping sheet.
@firestoreId String? get id;/// The date and time the shopping sheet was created.
@firestoreCreatedAt DateTime? get createdAt;/// The date and time the shopping sheet was last updated.
@firestoreUpdatedAt DateTime? get updatedAt;
/// Create a copy of ShoppingSheet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingSheetCopyWith<ShoppingSheet> get copyWith => _$ShoppingSheetCopyWithImpl<ShoppingSheet>(this as ShoppingSheet, _$identity);

  /// Serializes this ShoppingSheet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingSheet&&(identical(other.title, title) || other.title == title)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&const DeepCollectionEquality().equals(other.memberUserIds, memberUserIds)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,ownerUserId,const DeepCollectionEquality().hash(memberUserIds),id,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingSheet(title: $title, ownerUserId: $ownerUserId, memberUserIds: $memberUserIds, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShoppingSheetCopyWith<$Res>  {
  factory $ShoppingSheetCopyWith(ShoppingSheet value, $Res Function(ShoppingSheet) _then) = _$ShoppingSheetCopyWithImpl;
@useResult
$Res call({
 String? title, String? ownerUserId, List<String> memberUserIds,@firestoreId String? id,@firestoreCreatedAt DateTime? createdAt,@firestoreUpdatedAt DateTime? updatedAt
});




}
/// @nodoc
class _$ShoppingSheetCopyWithImpl<$Res>
    implements $ShoppingSheetCopyWith<$Res> {
  _$ShoppingSheetCopyWithImpl(this._self, this._then);

  final ShoppingSheet _self;
  final $Res Function(ShoppingSheet) _then;

/// Create a copy of ShoppingSheet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? ownerUserId = freezed,Object? memberUserIds = null,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,ownerUserId: freezed == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String?,memberUserIds: null == memberUserIds ? _self.memberUserIds : memberUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc

@firestoreModel
class _ShoppingSheet extends ShoppingSheet {
  const _ShoppingSheet({this.title, this.ownerUserId, final  List<String> memberUserIds = const [], @firestoreId this.id, @firestoreCreatedAt this.createdAt, @firestoreUpdatedAt this.updatedAt}): _memberUserIds = memberUserIds,super._();
  factory _ShoppingSheet.fromJson(Map<String, dynamic> json) => _$ShoppingSheetFromJson(json);

/// The title of the shopping sheet.
@override final  String? title;
/// The user ID of the owner of the shopping sheet.
///
/// - The owner is the creator of the shopping sheet and can view, edit,
///   and delete the shopping sheet.
@override final  String? ownerUserId;
/// The user IDs of the members of the shopping sheet.
///
/// - Members are added by the owner and can view and edit the shopping
///   sheet.
 final  List<String> _memberUserIds;
/// The user IDs of the members of the shopping sheet.
///
/// - Members are added by the owner and can view and edit the shopping
///   sheet.
@override@JsonKey() List<String> get memberUserIds {
  if (_memberUserIds is EqualUnmodifiableListView) return _memberUserIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberUserIds);
}

/// The ID of the shopping sheet.
@override@firestoreId final  String? id;
/// The date and time the shopping sheet was created.
@override@firestoreCreatedAt final  DateTime? createdAt;
/// The date and time the shopping sheet was last updated.
@override@firestoreUpdatedAt final  DateTime? updatedAt;

/// Create a copy of ShoppingSheet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingSheetCopyWith<_ShoppingSheet> get copyWith => __$ShoppingSheetCopyWithImpl<_ShoppingSheet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingSheetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingSheet&&(identical(other.title, title) || other.title == title)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&const DeepCollectionEquality().equals(other._memberUserIds, _memberUserIds)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,ownerUserId,const DeepCollectionEquality().hash(_memberUserIds),id,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingSheet(title: $title, ownerUserId: $ownerUserId, memberUserIds: $memberUserIds, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShoppingSheetCopyWith<$Res> implements $ShoppingSheetCopyWith<$Res> {
  factory _$ShoppingSheetCopyWith(_ShoppingSheet value, $Res Function(_ShoppingSheet) _then) = __$ShoppingSheetCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? ownerUserId, List<String> memberUserIds,@firestoreId String? id,@firestoreCreatedAt DateTime? createdAt,@firestoreUpdatedAt DateTime? updatedAt
});




}
/// @nodoc
class __$ShoppingSheetCopyWithImpl<$Res>
    implements _$ShoppingSheetCopyWith<$Res> {
  __$ShoppingSheetCopyWithImpl(this._self, this._then);

  final _ShoppingSheet _self;
  final $Res Function(_ShoppingSheet) _then;

/// Create a copy of ShoppingSheet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? ownerUserId = freezed,Object? memberUserIds = null,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ShoppingSheet(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,ownerUserId: freezed == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String?,memberUserIds: null == memberUserIds ? _self._memberUserIds : memberUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
