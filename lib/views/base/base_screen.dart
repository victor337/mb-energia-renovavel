import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/base/base_controller.dart';
import 'package:mbenergiarenovavel/views/home/home_screen.dart';
import 'package:mbenergiarenovavel/views/order/order_screen.dart';


class BaseScreen extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<BaseController>(
          init: BaseController(),
          builder: (baseController){
            if(baseController.page == 0){
              return HomeScreen();
            } else if(baseController.page == 1){
              return OrderScreen();
            }
            return Container();
          }
        ),
      ),
    );
  }
}