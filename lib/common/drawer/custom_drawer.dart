import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/common/drawer/components/drawer_option.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/user/user_controller.dart';
import 'package:mbenergiarenovavel/models/drawer/drawer_option_model.dart';


class CustomDrawer extends GetView {
  final SizeScreen sizeScreen = SizeScreen();

  final List<DrawerOptionModel> orders = [
    DrawerOptionModel('Listar OS', 0),
    DrawerOptionModel('Perfil', 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.fromLTRB(20, 40, 10, 40),
            width: sizeScreen.getWidthScreen(context),
            child: GetBuilder<UserController>(
              builder: (userController){
                print(userController.user);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userController.user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),
                    ),
                    Text(
                      userController.user.email,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}