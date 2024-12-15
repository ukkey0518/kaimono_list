// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingItem _$ShoppingItemFromJson(Map<String, dynamic> json) {
  return _ShoppingItem.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItem {
  /// The name of the shopping item.
  String? get name => throw _privateConstructorUsedError;

  /// The user who created the shopping item.
  ShoppingItemCreateUser get createdBy => throw _privateConstructorUsedError;

  /// Whether the shopping item is completed.
  bool get isCompleted => throw _privateConstructorUsedError;

  /// The index of the shopping item.
  int? get index => throw _privateConstructorUsedError;

  /// The ID of the shopping item.
  @firestoreId
  String? get id => throw _privateConstructorUsedError;

  /// The date and time the shopping item was created.
  @firestoreCreatedAt
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// The date and time the shopping item was last updated.
  @firestoreUpdatedAt
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ShoppingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemCopyWith<ShoppingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemCopyWith<$Res> {
  factory $ShoppingItemCopyWith(
          ShoppingItem value, $Res Function(ShoppingItem) then) =
      _$ShoppingItemCopyWithImpl<$Res, ShoppingItem>;
  @useResult
  $Res call(
      {String? name,
      ShoppingItemCreateUser createdBy,
      bool isCompleted,
      int? index,
      @firestoreId String? id,
      @firestoreCreatedAt DateTime? createdAt,
      @firestoreUpdatedAt DateTime? updatedAt});

  $ShoppingItemCreateUserCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$ShoppingItemCopyWithImpl<$Res, $Val extends ShoppingItem>
    implements $ShoppingItemCopyWith<$Res> {
  _$ShoppingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? createdBy = null,
    Object? isCompleted = null,
    Object? index = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as ShoppingItemCreateUser,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingItemCreateUserCopyWith<$Res> get createdBy {
    return $ShoppingItemCreateUserCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShoppingItemImplCopyWith<$Res>
    implements $ShoppingItemCopyWith<$Res> {
  factory _$$ShoppingItemImplCopyWith(
          _$ShoppingItemImpl value, $Res Function(_$ShoppingItemImpl) then) =
      __$$ShoppingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      ShoppingItemCreateUser createdBy,
      bool isCompleted,
      int? index,
      @firestoreId String? id,
      @firestoreCreatedAt DateTime? createdAt,
      @firestoreUpdatedAt DateTime? updatedAt});

  @override
  $ShoppingItemCreateUserCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$ShoppingItemImplCopyWithImpl<$Res>
    extends _$ShoppingItemCopyWithImpl<$Res, _$ShoppingItemImpl>
    implements _$$ShoppingItemImplCopyWith<$Res> {
  __$$ShoppingItemImplCopyWithImpl(
      _$ShoppingItemImpl _value, $Res Function(_$ShoppingItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? createdBy = null,
    Object? isCompleted = null,
    Object? index = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ShoppingItemImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as ShoppingItemCreateUser,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@firestoreModel
class _$ShoppingItemImpl extends _ShoppingItem {
  const _$ShoppingItemImpl(
      {this.name,
      this.createdBy = const ShoppingItemCreateUser(),
      this.isCompleted = false,
      this.index,
      @firestoreId this.id,
      @firestoreCreatedAt this.createdAt,
      @firestoreUpdatedAt this.updatedAt})
      : super._();

  factory _$ShoppingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemImplFromJson(json);

  /// The name of the shopping item.
  @override
  final String? name;

  /// The user who created the shopping item.
  @override
  @JsonKey()
  final ShoppingItemCreateUser createdBy;

  /// Whether the shopping item is completed.
  @override
  @JsonKey()
  final bool isCompleted;

  /// The index of the shopping item.
  @override
  final int? index;

  /// The ID of the shopping item.
  @override
  @firestoreId
  final String? id;

  /// The date and time the shopping item was created.
  @override
  @firestoreCreatedAt
  final DateTime? createdAt;

  /// The date and time the shopping item was last updated.
  @override
  @firestoreUpdatedAt
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ShoppingItem(name: $name, createdBy: $createdBy, isCompleted: $isCompleted, index: $index, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, createdBy, isCompleted,
      index, id, createdAt, updatedAt);

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemImplCopyWith<_$ShoppingItemImpl> get copyWith =>
      __$$ShoppingItemImplCopyWithImpl<_$ShoppingItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemImplToJson(
      this,
    );
  }
}

abstract class _ShoppingItem extends ShoppingItem {
  const factory _ShoppingItem(
      {final String? name,
      final ShoppingItemCreateUser createdBy,
      final bool isCompleted,
      final int? index,
      @firestoreId final String? id,
      @firestoreCreatedAt final DateTime? createdAt,
      @firestoreUpdatedAt final DateTime? updatedAt}) = _$ShoppingItemImpl;
  const _ShoppingItem._() : super._();

  factory _ShoppingItem.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemImpl.fromJson;

  /// The name of the shopping item.
  @override
  String? get name;

  /// The user who created the shopping item.
  @override
  ShoppingItemCreateUser get createdBy;

  /// Whether the shopping item is completed.
  @override
  bool get isCompleted;

  /// The index of the shopping item.
  @override
  int? get index;

  /// The ID of the shopping item.
  @override
  @firestoreId
  String? get id;

  /// The date and time the shopping item was created.
  @override
  @firestoreCreatedAt
  DateTime? get createdAt;

  /// The date and time the shopping item was last updated.
  @override
  @firestoreUpdatedAt
  DateTime? get updatedAt;

  /// Create a copy of ShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemImplCopyWith<_$ShoppingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoppingItemCreateUser _$ShoppingItemCreateUserFromJson(
    Map<String, dynamic> json) {
  return _ShoppingItemCreateUser.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItemCreateUser {
  /// The ID of the user who created the shopping item.
  String? get id => throw _privateConstructorUsedError;

  /// The name of the user who created the shopping item.
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this ShoppingItemCreateUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemCreateUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemCreateUserCopyWith<ShoppingItemCreateUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemCreateUserCopyWith<$Res> {
  factory $ShoppingItemCreateUserCopyWith(ShoppingItemCreateUser value,
          $Res Function(ShoppingItemCreateUser) then) =
      _$ShoppingItemCreateUserCopyWithImpl<$Res, ShoppingItemCreateUser>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$ShoppingItemCreateUserCopyWithImpl<$Res,
        $Val extends ShoppingItemCreateUser>
    implements $ShoppingItemCreateUserCopyWith<$Res> {
  _$ShoppingItemCreateUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemCreateUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemCreateUserImplCopyWith<$Res>
    implements $ShoppingItemCreateUserCopyWith<$Res> {
  factory _$$ShoppingItemCreateUserImplCopyWith(
          _$ShoppingItemCreateUserImpl value,
          $Res Function(_$ShoppingItemCreateUserImpl) then) =
      __$$ShoppingItemCreateUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$ShoppingItemCreateUserImplCopyWithImpl<$Res>
    extends _$ShoppingItemCreateUserCopyWithImpl<$Res,
        _$ShoppingItemCreateUserImpl>
    implements _$$ShoppingItemCreateUserImplCopyWith<$Res> {
  __$$ShoppingItemCreateUserImplCopyWithImpl(
      _$ShoppingItemCreateUserImpl _value,
      $Res Function(_$ShoppingItemCreateUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemCreateUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ShoppingItemCreateUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@firestoreModel
class _$ShoppingItemCreateUserImpl extends _ShoppingItemCreateUser {
  const _$ShoppingItemCreateUserImpl({this.id, this.name}) : super._();

  factory _$ShoppingItemCreateUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemCreateUserImplFromJson(json);

  /// The ID of the user who created the shopping item.
  @override
  final String? id;

  /// The name of the user who created the shopping item.
  @override
  final String? name;

  @override
  String toString() {
    return 'ShoppingItemCreateUser(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemCreateUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ShoppingItemCreateUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemCreateUserImplCopyWith<_$ShoppingItemCreateUserImpl>
      get copyWith => __$$ShoppingItemCreateUserImplCopyWithImpl<
          _$ShoppingItemCreateUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemCreateUserImplToJson(
      this,
    );
  }
}

abstract class _ShoppingItemCreateUser extends ShoppingItemCreateUser {
  const factory _ShoppingItemCreateUser(
      {final String? id, final String? name}) = _$ShoppingItemCreateUserImpl;
  const _ShoppingItemCreateUser._() : super._();

  factory _ShoppingItemCreateUser.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemCreateUserImpl.fromJson;

  /// The ID of the user who created the shopping item.
  @override
  String? get id;

  /// The name of the user who created the shopping item.
  @override
  String? get name;

  /// Create a copy of ShoppingItemCreateUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemCreateUserImplCopyWith<_$ShoppingItemCreateUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
