// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModelsDataGroups _$SessionModelsDataGroupsFromJson(
        Map<String, dynamic> json) =>
    SessionModelsDataGroups(
      json['id'] as int,
      json['user_id'] as int,
      json['name'] as String,
      json['created_at'] as String,
      json['info'] as String,
      json['avatar'] as String,
      json['is_pwd'] as int,
      json['hot'] as int,
    );

Map<String, dynamic> _$SessionModelsDataGroupsToJson(
        SessionModelsDataGroups instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'created_at': instance.created_at,
      'info': instance.info,
      'avatar': instance.avatar,
      'is_pwd': instance.is_pwd,
      'hot': instance.hot,
    };

SessionModelsDataUsers _$SessionModelsDataUsersFromJson(
        Map<String, dynamic> json) =>
    SessionModelsDataUsers(
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
      json['avatar'] as String,
      json['status'] as int,
      json['bio'] as String,
      json['sex'] as int,
      json['client_type'] as int,
      json['age'] as int,
      json['last_login_time'] as String,
    );

Map<String, dynamic> _$SessionModelsDataUsersToJson(
        SessionModelsDataUsers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'status': instance.status,
      'bio': instance.bio,
      'sex': instance.sex,
      'client_type': instance.client_type,
      'age': instance.age,
      'last_login_time': instance.last_login_time,
    };

SessionModelsData _$SessionModelsDataFromJson(Map<String, dynamic> json) =>
    SessionModelsData(
      json['id'] as int,
      json['form_id'] as int,
      json['to_id'] as int,
      json['group_id'] as int,
      json['created_at'] as String,
      json['top_status'] as int,
      json['top_time'] as String,
      json['note'] as String,
      json['channel_type'] as int,
      json['name'] as String,
      json['avatar'] as String,
      json['status'] as int,
      SessionModelsDataUsers.fromJson(json['Users'] as Map<String, dynamic>),
      SessionModelsDataGroups.fromJson(json['Groups'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionModelsDataToJson(SessionModelsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'form_id': instance.form_id,
      'to_id': instance.to_id,
      'group_id': instance.group_id,
      'created_at': instance.created_at,
      'top_status': instance.top_status,
      'top_time': instance.top_time,
      'note': instance.note,
      'channel_type': instance.channel_type,
      'name': instance.name,
      'avatar': instance.avatar,
      'status': instance.status,
      'Users': instance.Users,
      'Groups': instance.Groups,
    };

SessionModels _$SessionModelsFromJson(Map<String, dynamic> json) =>
    SessionModels(
      json['code'] as int,
      json['message'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => SessionModelsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['HttpCode'] as int,
    );

Map<String, dynamic> _$SessionModelsToJson(SessionModels instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'HttpCode': instance.HttpCode,
    };
