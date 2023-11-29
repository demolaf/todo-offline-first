// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      color: json['color'] as String?,
      time: json['time'] as String?,
      lastModifiedAt: json['lastModifiedAt'] as String?,
      priority: json['priority'] as String?,
      synced: json['synced'] as bool?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'color': instance.color,
      'time': instance.time,
      'lastModifiedAt': instance.lastModifiedAt,
      'priority': instance.priority,
      'synced': instance.synced,
      'completed': instance.completed,
    };
