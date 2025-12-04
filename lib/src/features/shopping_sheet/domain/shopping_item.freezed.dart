// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingItem {

/// The name of the shopping item.
 String? get name;/// The user who created the shopping item.
 ShoppingItemCreateUser get createdBy;/// Whether the shopping item is completed.
 bool get isCompleted;/// The index of the shopping item.
 int? get index;/// The ID of the shopping item.
@firestoreId String? get id;/// The date and time the shopping item was created.
@firestoreCreatedAt DateTime? get createdAt;/// The date and time the shopping item was last updated.
@firestoreUpdatedAt DateTime? get updatedAt;
/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemCopyWith<ShoppingItem> get copyWith => _$ShoppingItemCopyWithImpl<ShoppingItem>(this as ShoppingItem, _$identity);

  /// Serializes this ShoppingItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItem&&(identical(other.name, name) || other.name == name)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.index, index) || other.index == index)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,createdBy,isCompleted,index,id,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingItem(name: $name, createdBy: $createdBy, isCompleted: $isCompleted, index: $index, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemCopyWith<$Res>  {
  factory $ShoppingItemCopyWith(ShoppingItem value, $Res Function(ShoppingItem) _then) = _$ShoppingItemCopyWithImpl;
@useResult
$Res call({
 String? name, ShoppingItemCreateUser createdBy, bool isCompleted, int? index,@firestoreId String? id,@firestoreCreatedAt DateTime? createdAt,@firestoreUpdatedAt DateTime? updatedAt
});


$ShoppingItemCreateUserCopyWith<$Res> get createdBy;

}
/// @nodoc
class _$ShoppingItemCopyWithImpl<$Res>
    implements $ShoppingItemCopyWith<$Res> {
  _$ShoppingItemCopyWithImpl(this._self, this._then);

  final ShoppingItem _self;
  final $Res Function(ShoppingItem) _then;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? createdBy = null,Object? isCompleted = null,Object? index = freezed,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as ShoppingItemCreateUser,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShoppingItemCreateUserCopyWith<$Res> get createdBy {
  
  return $ShoppingItemCreateUserCopyWith<$Res>(_self.createdBy, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShoppingItem].
extension ShoppingItemPatterns on ShoppingItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItem value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItem value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  ShoppingItemCreateUser createdBy,  bool isCompleted,  int? index, @firestoreId  String? id, @firestoreCreatedAt  DateTime? createdAt, @firestoreUpdatedAt  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
return $default(_that.name,_that.createdBy,_that.isCompleted,_that.index,_that.id,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  ShoppingItemCreateUser createdBy,  bool isCompleted,  int? index, @firestoreId  String? id, @firestoreCreatedAt  DateTime? createdAt, @firestoreUpdatedAt  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItem():
return $default(_that.name,_that.createdBy,_that.isCompleted,_that.index,_that.id,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  ShoppingItemCreateUser createdBy,  bool isCompleted,  int? index, @firestoreId  String? id, @firestoreCreatedAt  DateTime? createdAt, @firestoreUpdatedAt  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItem() when $default != null:
return $default(_that.name,_that.createdBy,_that.isCompleted,_that.index,_that.id,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@firestoreModel
class _ShoppingItem extends ShoppingItem {
  const _ShoppingItem({this.name, this.createdBy = const ShoppingItemCreateUser(), this.isCompleted = false, this.index, @firestoreId this.id, @firestoreCreatedAt this.createdAt, @firestoreUpdatedAt this.updatedAt}): super._();
  factory _ShoppingItem.fromJson(Map<String, dynamic> json) => _$ShoppingItemFromJson(json);

/// The name of the shopping item.
@override final  String? name;
/// The user who created the shopping item.
@override@JsonKey() final  ShoppingItemCreateUser createdBy;
/// Whether the shopping item is completed.
@override@JsonKey() final  bool isCompleted;
/// The index of the shopping item.
@override final  int? index;
/// The ID of the shopping item.
@override@firestoreId final  String? id;
/// The date and time the shopping item was created.
@override@firestoreCreatedAt final  DateTime? createdAt;
/// The date and time the shopping item was last updated.
@override@firestoreUpdatedAt final  DateTime? updatedAt;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemCopyWith<_ShoppingItem> get copyWith => __$ShoppingItemCopyWithImpl<_ShoppingItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItem&&(identical(other.name, name) || other.name == name)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.index, index) || other.index == index)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,createdBy,isCompleted,index,id,createdAt,updatedAt);

@override
String toString() {
  return 'ShoppingItem(name: $name, createdBy: $createdBy, isCompleted: $isCompleted, index: $index, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemCopyWith<$Res> implements $ShoppingItemCopyWith<$Res> {
  factory _$ShoppingItemCopyWith(_ShoppingItem value, $Res Function(_ShoppingItem) _then) = __$ShoppingItemCopyWithImpl;
@override @useResult
$Res call({
 String? name, ShoppingItemCreateUser createdBy, bool isCompleted, int? index,@firestoreId String? id,@firestoreCreatedAt DateTime? createdAt,@firestoreUpdatedAt DateTime? updatedAt
});


@override $ShoppingItemCreateUserCopyWith<$Res> get createdBy;

}
/// @nodoc
class __$ShoppingItemCopyWithImpl<$Res>
    implements _$ShoppingItemCopyWith<$Res> {
  __$ShoppingItemCopyWithImpl(this._self, this._then);

  final _ShoppingItem _self;
  final $Res Function(_ShoppingItem) _then;

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? createdBy = null,Object? isCompleted = null,Object? index = freezed,Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ShoppingItem(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as ShoppingItemCreateUser,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShoppingItemCreateUserCopyWith<$Res> get createdBy {
  
  return $ShoppingItemCreateUserCopyWith<$Res>(_self.createdBy, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// @nodoc
mixin _$ShoppingItemCreateUser {

/// The ID of the user who created the shopping item.
 String? get id;/// The name of the user who created the shopping item.
 String? get name;
/// Create a copy of ShoppingItemCreateUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemCreateUserCopyWith<ShoppingItemCreateUser> get copyWith => _$ShoppingItemCreateUserCopyWithImpl<ShoppingItemCreateUser>(this as ShoppingItemCreateUser, _$identity);

  /// Serializes this ShoppingItemCreateUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemCreateUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ShoppingItemCreateUser(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemCreateUserCopyWith<$Res>  {
  factory $ShoppingItemCreateUserCopyWith(ShoppingItemCreateUser value, $Res Function(ShoppingItemCreateUser) _then) = _$ShoppingItemCreateUserCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$ShoppingItemCreateUserCopyWithImpl<$Res>
    implements $ShoppingItemCreateUserCopyWith<$Res> {
  _$ShoppingItemCreateUserCopyWithImpl(this._self, this._then);

  final ShoppingItemCreateUser _self;
  final $Res Function(ShoppingItemCreateUser) _then;

/// Create a copy of ShoppingItemCreateUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingItemCreateUser].
extension ShoppingItemCreateUserPatterns on ShoppingItemCreateUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItemCreateUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItemCreateUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItemCreateUser value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemCreateUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItemCreateUser value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemCreateUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItemCreateUser() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemCreateUser():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemCreateUser() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@firestoreModel
class _ShoppingItemCreateUser extends ShoppingItemCreateUser {
  const _ShoppingItemCreateUser({this.id, this.name}): super._();
  factory _ShoppingItemCreateUser.fromJson(Map<String, dynamic> json) => _$ShoppingItemCreateUserFromJson(json);

/// The ID of the user who created the shopping item.
@override final  String? id;
/// The name of the user who created the shopping item.
@override final  String? name;

/// Create a copy of ShoppingItemCreateUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemCreateUserCopyWith<_ShoppingItemCreateUser> get copyWith => __$ShoppingItemCreateUserCopyWithImpl<_ShoppingItemCreateUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingItemCreateUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItemCreateUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ShoppingItemCreateUser(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemCreateUserCopyWith<$Res> implements $ShoppingItemCreateUserCopyWith<$Res> {
  factory _$ShoppingItemCreateUserCopyWith(_ShoppingItemCreateUser value, $Res Function(_ShoppingItemCreateUser) _then) = __$ShoppingItemCreateUserCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$ShoppingItemCreateUserCopyWithImpl<$Res>
    implements _$ShoppingItemCreateUserCopyWith<$Res> {
  __$ShoppingItemCreateUserCopyWithImpl(this._self, this._then);

  final _ShoppingItemCreateUser _self;
  final $Res Function(_ShoppingItemCreateUser) _then;

/// Create a copy of ShoppingItemCreateUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_ShoppingItemCreateUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
