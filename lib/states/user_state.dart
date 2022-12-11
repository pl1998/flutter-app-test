import 'package:scoped_model/scoped_model.dart';


class AuthStateModel extends Model {
   late int  id;
   late String  uid;
   late String  name;
   late String  avatar;
   late String  email;
   late String  token;
   late int  expireTime;
   late int  ttl;

   void increment(){
     notifyListeners();
   }
}