
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModels{
  final int  code;
  final String  message;

  @JsonKey(nullable: true)
  final Data  data;
  final int  HttpCode;

  UserModels(this.code, this.message, this.data,this.HttpCode);

  factory UserModels.fromJson(Map<String,dynamic> json) => _$UserModelsFromJson(json);

  Map<String,dynamic> toJson() => _$UserModelsToJson(this);

}


@JsonSerializable()
class Data {

  final int  id;
  final String  uid;
  final String  name;
  final String  avatar;
  final String  email;
  final String  token;
  final int  expire_time;
  final int  ttl;

   Data(this.id, this.uid, this.name, this.avatar,this.email,this.token,this.expire_time,this.ttl);

    factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);

  Map<String,dynamic> toJson() => _$DataToJson(this);
}

