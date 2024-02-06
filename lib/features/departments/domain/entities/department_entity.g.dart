// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentEntityImpl _$$DepartmentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DepartmentEntityImpl(
      organizationId: json['organization_id'] as String,
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$DepartmentEntityImplToJson(
    _$DepartmentEntityImpl instance) {
  final val = <String, dynamic>{
    'organization_id': instance.organizationId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  return val;
}
