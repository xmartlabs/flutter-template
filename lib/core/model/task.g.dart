// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['_id'] as String,
      isCompleted: json['completed'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      '_id': instance.id,
      'completed': instance.isCompleted,
      'description': instance.description,
    };
