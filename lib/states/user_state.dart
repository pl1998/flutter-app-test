import 'package:scoped_model/scoped_model.dart';


class AuthStateModel extends Model {
    late int  id;
    late String  uid;
     String?  name;
    late String  avatar;
    late String  email;
   void increment(){
     notifyListeners();
   }
   // 设置数据
    setDataEvent(
       int id,String uid,String name,String avatar,String email
       ){
      this.id = id;
      this.uid = uid;
      this.avatar = avatar;
      this.email = email;
      notifyListeners();
   }
}