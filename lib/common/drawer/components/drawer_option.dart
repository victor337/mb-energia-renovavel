import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/base/base_controller.dart';
import 'package:mbenergiarenovavel/models/drawer/drawer_option_model.dart';


class DrawerOption extends StatelessWidget {

  final DrawerOptionModel drawerOptionModel;
  const DrawerOption(this.drawerOptionModel);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      init: BaseController(),
      builder: (baseController){
        return Container(
          color: baseController.page == drawerOptionModel.page ?
          const Color.fromARGB(200, 255, 255, 255) : Colors.transparent,
          child: ListTile(
            onTap: (){
              baseController.setPage(drawerOptionModel.page);
            },
            title: Text(
              drawerOptionModel.title,
              style: TextStyle(
                color:  baseController.page == drawerOptionModel.page ?
                Theme.of(context).primaryColor : Colors.white
              ),
            ),
            leading: Icon(
              drawerOptionModel.iconData,
              color: baseController.page == drawerOptionModel.page ?
                Theme.of(context).primaryColor : Colors.white
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: baseController.page == drawerOptionModel.page ?
                Theme.of(context).primaryColor : Colors.white
            ),
          ),
        );
      },
    );
  }
}