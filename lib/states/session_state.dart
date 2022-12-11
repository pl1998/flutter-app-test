import 'package:scoped_model/scoped_model.dart';

class SessionListData extends Model {
  late  List <SessionListState> data;
}

class SessionListState extends Model {
  late int id;
  late int formId;
  late int toId;
  late int groupId;
  late String createdAt;
  late int topStatus;
  late String topTime;
  late String note;
  late int channelType;
  late String name;
  late String avatar;
  late int status;
  late _Users users;
  late _Groups groups;
    void increment(){
    notifyListeners();
  }


}


class _Groups  {
  late int id;
  late int userId;
  late String name;
  late String createdAt;
  late String info;
  late String avatar;
  late int isPwd;
  late int hot;
}


class _Users {

  late int id;
  late String name;
  late String email;
  late String avatar;
  late int status;
  late String bio;
  late int sex;
  late int clientType;
  late int age;
  late String lastLoginTime;



}

