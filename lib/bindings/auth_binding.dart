import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/user/user_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController(), permanent: true,);
  }
}