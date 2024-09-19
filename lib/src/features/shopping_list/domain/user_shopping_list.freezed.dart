// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_shopping_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserShoppingList _$UserShoppingListFromJson(Map<String, dynamic> json) {
  return _UserShoppingList.fromJson(json);
}

/// @nodoc
mixin _$UserShoppingList {
  int get orderIndex => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @firestoreId
  String? get id => throw _privateConstructorUsedError;
  @firestoreCreatedAt
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @firestoreUpdatedAt
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserShoppingList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserShoppingList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserShoppingListCopyWith<UserShoppingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserShoppingListCopyWith<$Res> {
  factory $UserShoppingListCopyWith(
          UserShoppingList value, $Res Function(UserShoppingList) then) =
      _$UserShoppingListCopyWithImpl<$Res, UserShoppingList>;
  @useResult
  $Res call(
      {int orderIndex,
      String? name,
      @firestoreId String? id,
      @firestoreCreatedAt DateTime? createdAt,
      @firestoreUpdatedAt DateTime? updatedAt});
}

/// @nodoc
class _$UserShoppingListCopyWithImpl<$Res, $Val extends UserShoppingList>
    implements $UserShoppingListCopyWith<$Res> {
  _$UserShoppingListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserShoppingList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderIndex = null,
    Object? name = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
abstract class _$$UserShoppingListImplCopyWith<$Res>
    implements $UserShoppingListCopyWith<$Res> {
  factory _$$UserShoppingListImplCopyWith(_$UserShoppingListImpl value,
          $Res Function(_$UserShoppingListImpl) then) =
      __$$UserShoppingListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderIndex,
      String? name,
      @firestoreId String? id,
      @firestoreCreatedAt DateTime? createdAt,
      @firestoreUpdatedAt DateTime? updatedAt});
}

/// @nodoc
class __$$UserShoppingListImplCopyWithImpl<$Res>
    extends _$UserShoppingListCopyWithImpl<$Res, _$UserShoppingListImpl>
    implements _$$UserShoppingListImplCopyWith<$Res> {
  __$$UserShoppingListImplCopyWithImpl(_$UserShoppingListImpl _value,
      $Res Function(_$UserShoppingListImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserShoppingList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderIndex = null,
    Object? name = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserShoppingListImpl(
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$UserShoppingListImpl extends _UserShoppingList {
  const _$UserShoppingListImpl(
      {required this.orderIndex,
      this.name,
      @firestoreId this.id,
      @firestoreCreatedAt this.createdAt,
      @firestoreUpdatedAt this.updatedAt})
      : super._();

  factory _$UserShoppingListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShoppingListImplFromJson(json);

  @override
  final int orderIndex;
  @override
  final String? name;
  @override
  @firestoreId
  final String? id;
  @override
  @firestoreCreatedAt
  final DateTime? createdAt;
  @override
  @firestoreUpdatedAt
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserShoppingList(orderIndex: $orderIndex, name: $name, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShoppingListImpl &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderIndex, name, id, createdAt, updatedAt);

  /// Create a copy of UserShoppingList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserShoppingListImplCopyWith<_$UserShoppingListImpl> get copyWith =>
      __$$UserShoppingListImplCopyWithImpl<_$UserShoppingListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserShoppingListImplToJson(
      this,
    );
  }
}

abstract class _UserShoppingList extends UserShoppingList {
  const factory _UserShoppingList(
      {required final int orderIndex,
      final String? name,
      @firestoreId final String? id,
      @firestoreCreatedAt final DateTime? createdAt,
      @firestoreUpdatedAt final DateTime? updatedAt}) = _$UserShoppingListImpl;
  const _UserShoppingList._() : super._();

  factory _UserShoppingList.fromJson(Map<String, dynamic> json) =
      _$UserShoppingListImpl.fromJson;

  @override
  int get orderIndex;
  @override
  String? get name;
  @override
  @firestoreId
  String? get id;
  @override
  @firestoreCreatedAt
  DateTime? get createdAt;
  @override
  @firestoreUpdatedAt
  DateTime? get updatedAt;

  /// Create a copy of UserShoppingList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserShoppingListImplCopyWith<_$UserShoppingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
