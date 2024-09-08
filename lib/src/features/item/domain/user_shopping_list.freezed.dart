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
  String get orderIndex => throw _privateConstructorUsedError;
  @firestoreId
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserShoppingListCopyWith<UserShoppingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserShoppingListCopyWith<$Res> {
  factory $UserShoppingListCopyWith(
          UserShoppingList value, $Res Function(UserShoppingList) then) =
      _$UserShoppingListCopyWithImpl<$Res, UserShoppingList>;
  @useResult
  $Res call({String orderIndex, @firestoreId String? id});
}

/// @nodoc
class _$UserShoppingListCopyWithImpl<$Res, $Val extends UserShoppingList>
    implements $UserShoppingListCopyWith<$Res> {
  _$UserShoppingListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderIndex = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String orderIndex, @firestoreId String? id});
}

/// @nodoc
class __$$UserShoppingListImplCopyWithImpl<$Res>
    extends _$UserShoppingListCopyWithImpl<$Res, _$UserShoppingListImpl>
    implements _$$UserShoppingListImplCopyWith<$Res> {
  __$$UserShoppingListImplCopyWithImpl(_$UserShoppingListImpl _value,
      $Res Function(_$UserShoppingListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderIndex = null,
    Object? id = freezed,
  }) {
    return _then(_$UserShoppingListImpl(
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@firestoreModel
class _$UserShoppingListImpl extends _UserShoppingList {
  const _$UserShoppingListImpl({required this.orderIndex, @firestoreId this.id})
      : super._();

  factory _$UserShoppingListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShoppingListImplFromJson(json);

  @override
  final String orderIndex;
  @override
  @firestoreId
  final String? id;

  @override
  String toString() {
    return 'UserShoppingList(orderIndex: $orderIndex, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShoppingListImpl &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderIndex, id);

  @JsonKey(ignore: true)
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
      {required final String orderIndex,
      @firestoreId final String? id}) = _$UserShoppingListImpl;
  const _UserShoppingList._() : super._();

  factory _UserShoppingList.fromJson(Map<String, dynamic> json) =
      _$UserShoppingListImpl.fromJson;

  @override
  String get orderIndex;
  @override
  @firestoreId
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$UserShoppingListImplCopyWith<_$UserShoppingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
