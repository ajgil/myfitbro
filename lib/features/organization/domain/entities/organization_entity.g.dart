// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationEntityImpl _$$OrganizationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationEntityImpl(
      ownerId: json['owner_id'] as String,
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      settings: json['settings'] as Map<String, dynamic>?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$OrganizationEntityImplToJson(
    _$OrganizationEntityImpl instance) {
  final val = <String, dynamic>{
    'owner_id': instance.ownerId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  writeNotNull('description', instance.description);
  writeNotNull('created_at', instance.createdAt);
  val['settings'] = instance.settings;
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}
