// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogModelImpl _$$LogModelImplFromJson(Map<String, dynamic> json) =>
    _$LogModelImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      projectId: json['project_id'] as String?,
      hoursLogged: (json['hours_logged'] as num?)?.toInt(),
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      description: json['description'] as String?,
      projectName: json['project_name'] as String?,
    );

Map<String, dynamic> _$$LogModelImplToJson(_$LogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'project_id': instance.projectId,
      'hours_logged': instance.hoursLogged,
      'date_created': instance.dateCreated?.toIso8601String(),
      'description': instance.description,
      'project_name': instance.projectName,
    };
