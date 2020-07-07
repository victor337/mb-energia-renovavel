import 'package:get/get.dart';


class OrderController extends GetxController {

  String name;
  void setName(String setName){
    name = setName;
    update();
  }

  String city;
  void setCity(String setCity){
    city = setCity;
    update();
  }

  String phone;
  void setPhone(String setPhone){
    phone = setPhone;
    update();
  }

  String observation;
  void setObs(String setObs){
    observation = setObs;
    update();
  }

  bool get clietIsValid => name != null && name != '' && city != null && city != '' &&
    phone != null && phone != '';
  
}