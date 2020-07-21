import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/checkout/checkout_controller.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/controllers/user/user_controller.dart';
import 'package:mbenergiarenovavel/models/client/local_data_model.dart';
import 'package:mbenergiarenovavel/models/client/person_data_model.dart';
import 'package:mbenergiarenovavel/models/client/power_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class CreateExcel extends StatelessWidget {

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (orderController){
        return GetBuilder<CheckoutController>(
          init: CheckoutController(),
          builder: (checkoutController){
            return Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () async{
                      await PermissionHandler().requestPermissions([
                        PermissionGroup.storage,
                      ]);

                      final PermissionStatus permissionStorage = await PermissionHandler()
                        .checkPermissionStatus(PermissionGroup.storage);
                        
                      if(permissionStorage != PermissionStatus.granted){
                        return Get.snackbar(
                          'Erro',
                          'É necessário permirtir para executar essa função',
                        );
                      } else{
                        final Directory externalDir = await getExternalStorageDirectory();
                        final String externalDirPath = externalDir.path;

                        final PersonData personData = PersonData(
                          name: orderController.name,
                          city: orderController.city,
                          phone: orderController.phone,
                          obs: orderController.observation
                        );

                        final LocalDataModel localData = LocalDataModel(
                          type: orderController.type,
                          ligation: orderController.ligation,
                          disjuntor: orderController.disjutor,
                          generate: orderController.generator,
                          obs: orderController.observationLocal
                        );

                        final PowerData powerData = PowerData(
                          type: orderController.typePower,
                          typeRoof: orderController.typeRoof??'',
                          pos: orderController.optionPositioned,
                          meters: orderController.meters,
                          location: '${orderController.lat},${orderController.long}',
                          obs: orderController.observationPower
                        );

                        checkoutController.generateExcel(
                          userModel: userController.user,
                          images: orderController.pathsImages,
                          path: externalDirPath,
                          personData: personData,
                          localData: localData,
                          powerData: powerData,
                          onSucess: (){
                            Get.snackbar(
                              'Salvo',
                              'Você será redirecionado para o envio do email',
                              backgroundColor: Colors.green,
                              colorText: Colors.white
                            );
                          },
                          onFail: (){
                            Get.snackbar(
                              'Erro',
                              'Não foi possível salvar',
                              backgroundColor: Colors.red,
                              colorText: Colors.white
                            );
                          }
                        );                      
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: checkoutController.isLoading ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ) : const Text(
                        'Criar planilha e enviar',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: (){
                      Get.offAllNamed('/base');
                      orderController.cleanAll();
                    },
                    child: const Text(
                      'Limpar e voltar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}