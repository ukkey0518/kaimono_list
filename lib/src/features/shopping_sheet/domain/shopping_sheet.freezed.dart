// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingSheet _$ShoppingSheetFromJson(Map<String, dynamic> json) {
  return _ShoppingSheet.fromJson(json);
}

/// @nodoc
mixin _$ShoppingSheet {
  /// The title of the shopping sheet.
  String? get title => throw _privateConstructorUsedError;

  /// The user ID of the owner of the shopping sheet.
  ///
  /// - The owner is the creator of the shopping sheet and can view, edit,
  ///   and delete the shopping sheet.
  String? get ownerUserId => throw _privateConstructorUsedError;

  /// The user IDs of the members of the shopping sheet.
  ///
  /// - Members are added by the owner and can view and edit the shopping
  ///   sheet.
  List<String> get memberUserIds => throw _privateConstructorUsedError;

  /// The ID of the shopping sheet.
  @firestoreId
  String? get id => throw _privateConstructorUsedError;

  /// The date and time the shopping sheet was created.
  @firestoreCreatedAt
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// The date and time the shopping sheet was last updated.
  @firestoreUpdatedAt
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ShoppingSheet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingSheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingSheetCopyWith<ShoppingSheet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingSheetCopyWith<$Res> {
  factory $ShoppingSheetCopyWith(
          ShoppingSheet value, $Res Function(ShoppingSheet) then) =
      _$ShoppingSheetCopyWithImpl<$Res, ShoppingSheet>;
  @useResult
  $Res call(
      {String? title,
      String? ownerUserId,
      List<String> memberUserIds,
      @firestoreId String? id,
      @firestoreCreatedAt DateTime? createdAt,
      @firestoreUpdatedAt DateTime? updatedAt});
}

/// @nodoc
class _$ShoppingSheetCopyWithImpl<$Res, $Val extends ShoppingSheet>
    implements $ShoppingSheetCopyWith<$Res> {
  _$ShoppingSheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingSheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? ownerUserId = freezed,
    Object? memberUserIds = null,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerUserId: freezed == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      memberUserIds: null == memberUserIds
          ? _value.memberUserIds
          : memberUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$ShoppingSheetImplCopyWith<$Res>
    implements $ShoppingSheetCopyWith<$Res> {
  factory _$$ShoppingSheetImplCopyWith(
          _$ShoppingSheetImpl value, $Res Function(_$ShoppingSheetImpl) then) =
      __$$ShoppingSheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? ownerUserId,
      List<String> memberUserIds,
      @firestoreId String? id,
      @firestoreCreatedAt DateTime? createdAt,
      @firestoreUpdatedAt DateTime? updatedAt});
}

/// @nodoc
class __$$ShoppingSheetImplCopyWithImpl<$Res>
    extends _$ShoppingSheetCopyWithImpl<$Res, _$ShoppingSheetImpl>
    implements _$$ShoppingSheetImplCopyWith<$Res> {
  __$$ShoppingSheetImplCopyWithImpl(
      _$ShoppingSheetImpl _value, $Res Function(_$ShoppingSheetImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingSheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? ownerUserId = freezed,
    Object? memberUserIds = null,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ShoppingSheetImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerUserId: freezed == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      memberUserIds: null == memberUserIds
          ? _value._memberUserIds
          : memberUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$ShoppingSheetImpl extends _ShoppingSheet {
  const _$ShoppingSheetImpl(
      {this.title,
      this.ownerUserId,
      final List<String> memberUserIds = const [],
      @firestoreId this.id,
      @firestoreCreatedAt this.createdAt,
      @firestoreUpdatedAt this.updatedAt})
      : _memberUserIds = memberUserIds,
        super._();

  factory _$ShoppingSheetImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingSheetImplFromJson(json);

  /// The title of the shopping sheet.
  @override
  final String? title;

  /// The user ID of the owner of the shopping sheet.
  ///
  /// - The owner is the creator of the shopping sheet and can view, edit,
  ///   and delete the shopping sheet.
  @override
  final String? ownerUserId;

  /// The user IDs of the members of the shopping sheet.
  ///
  /// - Members are added by the owner and can view and edit the shopping
  ///   sheet.
  final List<String> _memberUserIds;

  /// The user IDs of the members of the shopping sheet.
  ///
  /// - Members are added by the owner and can view and edit the shopping
  ///   sheet.
  @override
  @JsonKey()
  List<String> get memberUserIds {
    if (_memberUserIds is EqualUnmodifiableListView) return _memberUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberUserIds);
  }

  /// The ID of the shopping sheet.
  @override
  @firestoreId
  final String? id;

  /// The date and time the shopping sheet was created.
  @override
  @firestoreCreatedAt
  final DateTime? createdAt;

  /// The date and time the shopping sheet was last updated.
  @override
  @firestoreUpdatedAt
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ShoppingSheet(title: $title, ownerUserId: $ownerUserId, memberUserIds: $memberUserIds, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingSheetImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            const DeepCollectionEquality()
                .equals(other._memberUserIds, _memberUserIds) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      ownerUserId,
      const DeepCollectionEquality().hash(_memberUserIds),
      id,
      createdAt,
      updatedAt);

  /// Create a copy of ShoppingSheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingSheetImplCopyWith<_$ShoppingSheetImpl> get copyWith =>
      __$$ShoppingSheetImplCopyWithImpl<_$ShoppingSheetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingSheetImplToJson(
      this,
    );
  }
}

abstract class _ShoppingSheet extends ShoppingSheet {
  const factory _ShoppingSheet(
      {final String? title,
      final String? ownerUserId,
      final List<String> memberUserIds,
      @firestoreId final String? id,
      @firestoreCreatedAt final DateTime? createdAt,
      @firestoreUpdatedAt final DateTime? updatedAt}) = _$ShoppingSheetImpl;
  const _ShoppingSheet._() : super._();

  factory _ShoppingSheet.fromJson(Map<String, dynamic> json) =
      _$ShoppingSheetImpl.fromJson;

  /// The title of the shopping sheet.
  @override
  String? get title;

  /// The user ID of the owner of the shopping sheet.
  ///
  /// - The owner is the creator of the shopping sheet and can view, edit,
  ///   and delete the shopping sheet.
  @override
  String? get ownerUserId;

  /// The user IDs of the members of the shopping sheet.
  ///
  /// - Members are added by the owner and can view and edit the shopping
  ///   sheet.
  @override
  List<String> get memberUserIds;

  /// The ID of the shopping sheet.
  @override
  @firestoreId
  String? get id;

  /// The date and time the shopping sheet was created.
  @override
  @firestoreCreatedAt
  DateTime? get createdAt;

  /// The date and time the shopping sheet was last updated.
  @override
  @firestoreUpdatedAt
  DateTime? get updatedAt;

  /// Create a copy of ShoppingSheet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingSheetImplCopyWith<_$ShoppingSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
