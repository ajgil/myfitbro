// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvironmentImpl _$$EnvironmentImplFromJson(Map<String, dynamic> json) =>
    _$EnvironmentImpl(
      supabaseUrl: json['supabaseUrl'] as String,
      supabaseAnonKey: json['supabaseAnonKey'] as String,
      supabaseAuthCallbackUrlHostname:
          json['supabaseAuthCallbackUrlHostname'] as String?,
    );

Map<String, dynamic> _$$EnvironmentImplToJson(_$EnvironmentImpl instance) =>
    <String, dynamic>{
      'supabaseUrl': instance.supabaseUrl,
      'supabaseAnonKey': instance.supabaseAnonKey,
      'supabaseAuthCallbackUrlHostname':
          instance.supabaseAuthCallbackUrlHostname,
    };
