import 'package:get/get.dart';


class LoginController extends GetxController {

  String name;
  void setName(String setName){
    name = setName;
    update();
  }

  String email;
  void setEmail(String setEmail){
    email = setEmail;
    update();
  }

  String pass;
  void setPass(String setPass){
    pass = setPass;
    update();
  }

}