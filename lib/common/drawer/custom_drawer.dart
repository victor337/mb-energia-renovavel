import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/common/drawer/components/drawer_option.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/user/user_controller.dart';
import 'package:mbenergiarenovavel/models/drawer/drawer_option_model.dart';


class CustomDrawer extends GetView {
  final SizeScreen sizeScreen = SizeScreen();

  final List<DrawerOptionModel> orders = [
    DrawerOptionModel(Icons.home, 'Início', 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
            width: sizeScreen.getWidthScreen(context),
            child: GetBuilder<UserController>(
              builder: (userController){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
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
                    ),
                    Container(
                      height: sizeScreen.getHeightScreen(context) / 10,
                      width: sizeScreen.getWidthScreen(context) / 3,
                      child: const FadeInImage(
                        placeholder: AssetImage('assets/transparent.png'),
                        image: AssetImage('assets/icon-mb.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 0, 204, 255),
              child: Column(
                children: orders.map((e) => DrawerOption(e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}