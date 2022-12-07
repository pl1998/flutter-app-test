// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModels _$UserModelsFromJson(Map<String, dynamic> json) => UserModels(
      json['code'] as int,
      json['message'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['HttpCode'] as int,
    );

Map<String, dynamic> _$UserModelsToJson(UserModels instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'HttpCode': instance.HttpCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as int,
      json['uid'] as String,
      json['name'] as String,
      json['avatar'] as String,
      json['email'] as String,
      json['token'] as String,
      json['expire_time'] as int,
      json['ttl'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'token': instance.token,
      'expire_time': instance.expire_time,
      'ttl': instance.ttl,
    };
