import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:permission_handler/permission_handler.dart';


class AddTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (orderController){
        return GestureDetector(
          onTap: (){
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.photo_camera),
                      onPressed: ()async{

                        await PermissionHandler().requestPermissions([
                          PermissionGroup.camera,
                          PermissionGroup.storage,
                        ]);

                        final PermissionStatus permissionStorage = await PermissionHandler()
                          .checkPermissionStatus(PermissionGroup.storage);
                        
                        final PermissionStatus permissionCamera = await PermissionHandler()
                          .checkPermissionStatus(PermissionGroup.camera);

                        if(permissionStorage != PermissionStatus.granted||
                          permissionCamera != PermissionStatus.granted){
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                content: const Text(
                                  'Permita para poder tirar a foto'
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              )
                            );
                            return;
                        } else {
                          Navigator.of(context).pop();
                          final picker = ImagePicker();

                          final PickedFile pickedFile = 
                          await picker.getImage(source: ImageSource.camera);
                          if(pickedFile == null){
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                content: const Text(
                                  'Nenhuma imagem selecionada'
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              )
                            );
                            return;
                          }
                          final File file = File(pickedFile.path);
                          final bool sucess = await GallerySaver.saveImage(file.path);
                          if(sucess){
                            orderController.addImageAccount(file.path);
                          } else {
                            Get.snackbar(
                              'Erro',
                              'Não foi possível salvar a imagem',
                              backgroundColor: Colors.red
                            );
                          }
                          
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_album),
                      onPressed: ()async{
                        
                        await PermissionHandler().requestPermissions([
                          PermissionGroup.camera,
                          PermissionGroup.storage,
                        ]);

                        final PermissionStatus permissionStorage = await PermissionHandler()
                          .checkPermissionStatus(PermissionGroup.storage);
                        
                        final PermissionStatus permissionCamera = await PermissionHandler()
                          .checkPermissionStatus(PermissionGroup.camera);

                        if(permissionStorage != PermissionStatus.granted||
                          permissionCamera != PermissionStatus.granted){
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              content: const Text(
                                'Permita para poder tirar a foto'
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            )
                          );
                          return;
                        } else {
                          Navigator.of(context).pop();
                          final picker = ImagePicker();

                          final PickedFile pickedFile = 
                          await picker.getImage(source: ImageSource.gallery);
                          if(pickedFile == null){
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                content: const Text(
                                  'Nenhuma imagem selecionada'
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              )
                            );
                            return;
                          }
                          final bool sucess = await GallerySaver.saveImage(pickedFile.path);
                          if(sucess){
                            orderController.addImageAccount(pickedFile.path);
                          } else {
                            Get.snackbar('Erro', 'Não foi possível salvar');
                          }
                        }
                      },
                    ),
                  ],
                ),
              )
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.add, color: Colors.white,),
          ),
        );
      },
    );
  }
}