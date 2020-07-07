import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderController(), permanent: true,);
  }
}