import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/user/user_controller.dart';


class SplashScreen extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      initState: (_){
        Future.delayed(const Duration(seconds: 4)).then((_){
          Get.offNamed('/login');
        });
      },
      builder: (userController){
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: const Color.fromARGB(255, 44, 50, 84),
              height: sizeScreen.getHeightScreen(context),
              width: sizeScreen.getWidthScreen(context),
              child: Center(
                child: Container(
                  height: sizeScreen.getHeightScreen(context) / 4,
                  child: const FadeInImage(
                    placeholder: AssetImage('assets/transparent.png'),
                    image: AssetImage('assets/icon-mb.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}