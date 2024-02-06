// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrganizationEntity _$OrganizationEntityFromJson(Map<String, dynamic> json) {
  return _OrganizationEntity.fromJson(json);
}

/// @nodoc
mixin _$OrganizationEntity {
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get settings => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationEntityCopyWith<OrganizationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationEntityCopyWith<$Res> {
  factory $OrganizationEntityCopyWith(
          OrganizationEntity value, $Res Function(OrganizationEntity) then) =
      _$OrganizationEntityCopyWithImpl<$Res, OrganizationEntity>;
  @useResult
  $Res call(
      {String ownerId,
      @JsonKey(includeIfNull: false) String? id,
      String name,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) String? createdAt,
      Map<String, dynamic>? settings,
      @JsonKey(includeIfNull: false) String? updatedAt});
}

/// @nodoc
class _$OrganizationEntityCopyWithImpl<$Res, $Val extends OrganizationEntity>
    implements $OrganizationEntityCopyWith<$Res> {
  _$OrganizationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? settings = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizationEntityImplCopyWith<$Res>
    implements $OrganizationEntityCopyWith<$Res> {
  factory _$$OrganizationEntityImplCopyWith(_$OrganizationEntityImpl value,
          $Res Function(_$OrganizationEntityImpl) then) =
      __$$OrganizationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ownerId,
      @JsonKey(includeIfNull: false) String? id,
      String name,
      @JsonKey(includeIfNull: false) String? description,
      @JsonKey(includeIfNull: false) String? createdAt,
      Map<String, dynamic>? settings,
      @JsonKey(includeIfNull: false) String? updatedAt});
}

/// @nodoc
class __$$OrganizationEntityImplCopyWithImpl<$Res>
    extends _$OrganizationEntityCopyWithImpl<$Res, _$OrganizationEntityImpl>
    implements _$$OrganizationEntityImplCopyWith<$Res> {
  __$$OrganizationEntityImplCopyWithImpl(_$OrganizationEntityImpl _value,
      $Res Function(_$OrganizationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? settings = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrganizationEntityImpl(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrganizationEntityImpl implements _OrganizationEntity {
  const _$OrganizationEntityImpl(
      {required this.ownerId,
      @JsonKey(includeIfNull: false) this.id,
      this.name = '',
      @JsonKey(includeIfNull: false) this.description,
      @JsonKey(includeIfNull: false) this.createdAt,
      final Map<String, dynamic>? settings,
      @JsonKey(includeIfNull: false) this.updatedAt})
      : _settings = settings;

  factory _$OrganizationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationEntityImplFromJson(json);

  @override
  final String ownerId;
  @override
  @JsonKey(includeIfNull: false)
  final String? id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(includeIfNull: false)
  final String? description;
  @override
  @JsonKey(includeIfNull: false)
  final String? createdAt;
  final Map<String, dynamic>? _settings;
  @override
  Map<String, dynamic>? get settings {
    final value = _settings;
    if (value == null) return null;
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(includeIfNull: false)
  final String? updatedAt;

  @override
  String toString() {
    return 'OrganizationEntity(ownerId: $ownerId, id: $id, name: $name, description: $description, createdAt: $createdAt, settings: $settings, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationEntityImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ownerId, id, name, description,
      createdAt, const DeepCollectionEquality().hash(_settings), updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationEntityImplCopyWith<_$OrganizationEntityImpl> get copyWith =>
      __$$OrganizationEntityImplCopyWithImpl<_$OrganizationEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationEntityImplToJson(
      this,
    );
  }
}

abstract class _OrganizationEntity implements OrganizationEntity {
  const factory _OrganizationEntity(
          {required final String ownerId,
          @JsonKey(includeIfNull: false) final String? id,
          final String name,
          @JsonKey(includeIfNull: false) final String? description,
          @JsonKey(includeIfNull: false) final String? createdAt,
          final Map<String, dynamic>? settings,
          @JsonKey(includeIfNull: false) final String? updatedAt}) =
      _$OrganizationEntityImpl;

  factory _OrganizationEntity.fromJson(Map<String, dynamic> json) =
      _$OrganizationEntityImpl.fromJson;

  @override
  String get ownerId;
  @override
  @JsonKey(includeIfNull: false)
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(includeIfNull: false)
  String? get description;
  @override
  @JsonKey(includeIfNull: false)
  String? get createdAt;
  @override
  Map<String, dynamic>? get settings;
  @override
  @JsonKey(includeIfNull: false)
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrganizationEntityImplCopyWith<_$OrganizationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
