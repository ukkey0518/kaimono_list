// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_shopping_list_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserShoppingListSetting _$UserShoppingListSettingFromJson(
    Map<String, dynamic> json) {
  return _UserShoppingListSetting.fromJson(json);
}

/// @nodoc
mixin _$UserShoppingListSetting {
  List<UserShoppingList> get userShoppingLists =>
      throw _privateConstructorUsedError;
  @firestoreId
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this UserShoppingListSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserShoppingListSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserShoppingListSettingCopyWith<UserShoppingListSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserShoppingListSettingCopyWith<$Res> {
  factory $UserShoppingListSettingCopyWith(UserShoppingListSetting value,
          $Res Function(UserShoppingListSetting) then) =
      _$UserShoppingListSettingCopyWithImpl<$Res, UserShoppingListSetting>;
  @useResult
  $Res call(
      {List<UserShoppingList> userShoppingLists, @firestoreId String? id});
}

/// @nodoc
class _$UserShoppingListSettingCopyWithImpl<$Res,
        $Val extends UserShoppingListSetting>
    implements $UserShoppingListSettingCopyWith<$Res> {
  _$UserShoppingListSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserShoppingListSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userShoppingLists = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      userShoppingLists: null == userShoppingLists
          ? _value.userShoppingLists
          : userShoppingLists // ignore: cast_nullable_to_non_nullable
              as List<UserShoppingList>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserShoppingListSettingImplCopyWith<$Res>
    implements $UserShoppingListSettingCopyWith<$Res> {
  factory _$$UserShoppingListSettingImplCopyWith(
          _$UserShoppingListSettingImpl value,
          $Res Function(_$UserShoppingListSettingImpl) then) =
      __$$UserShoppingListSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserShoppingList> userShoppingLists, @firestoreId String? id});
}

/// @nodoc
class __$$UserShoppingListSettingImplCopyWithImpl<$Res>
    extends _$UserShoppingListSettingCopyWithImpl<$Res,
        _$UserShoppingListSettingImpl>
    implements _$$UserShoppingListSettingImplCopyWith<$Res> {
  __$$UserShoppingListSettingImplCopyWithImpl(
      _$UserShoppingListSettingImpl _value,
      $Res Function(_$UserShoppingListSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserShoppingListSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userShoppingLists = null,
    Object? id = freezed,
  }) {
    return _then(_$UserShoppingListSettingImpl(
      userShoppingLists: null == userShoppingLists
          ? _value._userShoppingLists
          : userShoppingLists // ignore: cast_nullable_to_non_nullable
              as List<UserShoppingList>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@firestoreModel
class _$UserShoppingListSettingImpl extends _UserShoppingListSetting {
  const _$UserShoppingListSettingImpl(
      {required final List<UserShoppingList> userShoppingLists,
      @firestoreId this.id})
      : _userShoppingLists = userShoppingLists,
        super._();

  factory _$UserShoppingListSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShoppingListSettingImplFromJson(json);

  final List<UserShoppingList> _userShoppingLists;
  @override
  List<UserShoppingList> get userShoppingLists {
    if (_userShoppingLists is EqualUnmodifiableListView)
      return _userShoppingLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userShoppingLists);
  }

  @override
  @firestoreId
  final String? id;

  @override
  String toString() {
    return 'UserShoppingListSetting(userShoppingLists: $userShoppingLists, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShoppingListSettingImpl &&
            const DeepCollectionEquality()
                .equals(other._userShoppingLists, _userShoppingLists) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userShoppingLists), id);

  /// Create a copy of UserShoppingListSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserShoppingListSettingImplCopyWith<_$UserShoppingListSettingImpl>
      get copyWith => __$$UserShoppingListSettingImplCopyWithImpl<
          _$UserShoppingListSettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserShoppingListSettingImplToJson(
      this,
    );
  }
}

abstract class _UserShoppingListSetting extends UserShoppingListSetting {
  const factory _UserShoppingListSetting(
      {required final List<UserShoppingList> userShoppingLists,
      @firestoreId final String? id}) = _$UserShoppingListSettingImpl;
  const _UserShoppingListSetting._() : super._();

  factory _UserShoppingListSetting.fromJson(Map<String, dynamic> json) =
      _$UserShoppingListSettingImpl.fromJson;

  @override
  List<UserShoppingList> get userShoppingLists;
  @override
  @firestoreId
  String? get id;

  /// Create a copy of UserShoppingListSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserShoppingListSettingImplCopyWith<_$UserShoppingListSettingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserShoppingList _$UserShoppingListFromJson(Map<String, dynamic> json) {
  return _UserShoppingList.fromJson(json);
}

/// @nodoc
mixin _$UserShoppingList {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

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
  $Res call({String id, String name});
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
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String id, String name});
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
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$UserShoppingListImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@firestoreModel
class _$UserShoppingListImpl extends _UserShoppingList {
  const _$UserShoppingListImpl({required this.id, required this.name})
      : super._();

  factory _$UserShoppingListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShoppingListImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'UserShoppingList(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShoppingListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

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
      {required final String id,
      required final String name}) = _$UserShoppingListImpl;
  const _UserShoppingList._() : super._();

  factory _UserShoppingList.fromJson(Map<String, dynamic> json) =
      _$UserShoppingListImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of UserShoppingList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserShoppingListImplCopyWith<_$UserShoppingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
