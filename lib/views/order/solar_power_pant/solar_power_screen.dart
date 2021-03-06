import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/login/components/custom_form_field.dart';
import 'package:mbenergiarenovavel/common/order/dropdown.dart';
import 'package:mbenergiarenovavel/views/order/photos/main_photos.dart';
import 'package:mbenergiarenovavel/views/order/solar_power_pant/components/get_local.dart';


class SolarPowerScreen extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();

  final List<String> optionsType = ['Selecione', 'Solo', 'Telhado'];
  final List<String> optionRoof = ['Selecione', 'Metálico', 'Colonial', 'Eternit'];
  final List<String> optionsPostion = ['Selecione', 'Norte', 'Sul', 'Leste', 'Oeste'];

  final FocusNode focusMeters = FocusNode();
  final FocusNode focusObs = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 44, 50, 84),
                shape: BoxShape.circle
              ),
              padding: const EdgeInsets.all(10),
              height: AppBar().preferredSize.height,
              child: const FadeInImage(
                placeholder: AssetImage('assets/transparent.png'),
                image: AssetImage('assets/icon-mb.png'),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 153, 51,),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          height: sizeScreen.getHeightScreenWidthAppBar(context, AppBar()),
          width: sizeScreen.getWidthScreen(context),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 153, 51,),
                Color.fromARGB(255, 255, 204, 0),
              ]
            ),
          ),
          child: Center(
            child: GetBuilder<OrderController>(
              init: OrderController(),
              builder: (orderController){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: avoid_redundant_argument_values
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: const Text(
                          'Dados da Usina Solar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    GetBuilder<OrderController>(
                      init: OrderController(),
                      builder: (orderController){
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                DropDown(
                                  title: 'Solo/Telhado',
                                  options: optionsType,
                                  onChanged: orderController.setTypePower,
                                  value: orderController.typePower??'Selecione',
                                ),
                                Visibility(
                                  visible: orderController.typePower == 'Telhado',
                                  child: DropDown(
                                    title: 'Tipo do Telhado',
                                    options: optionRoof,
                                    onChanged: orderController.setTypeRoof,
                                    value: orderController.typeRoof??'Selecione',
                                  ),
                                ),
                                DropDown(
                                  title: 'Posição',
                                  options: optionsPostion,
                                  onChanged: orderController.setOptionPositioned,
                                  value: orderController.optionPositioned??'Selecione',
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 25,),
                    GetLocal(),
                    const SizedBox(height: 25,),
                    CustomFormField(
                      focusNode: focusMeters,
                      onChanged: (meters){
                        orderController.setMeters(meters);
                      },
                      hintText: 'M²',
                      onFieldSubmitted: (meters){
                        focusMeters.unfocus();
                        FocusScope.of(context).requestFocus(focusObs);
                      },
                      initalValue: orderController.meters??'',
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.number,
                      iconData: Icons.settings,
                      enabled: null
                    ),
                    Container(
                      height: 100,
                      child: CustomFormField(
                        focusNode: focusObs,
                        onChanged: (obs){
                          orderController.setObsPower(obs);
                        },
                        hintText: 'Observação',
                        onFieldSubmitted: (obs){
                          focusObs.unfocus();
                        },
                        initalValue: orderController.observationPower??'',
                        textInputAction: TextInputAction.done,
                        keyBoardType: TextInputType.multiline,
                        iconData: Icons.list,
                        enabled: null
                      ),
                    ),
                    const SizedBox(height: 20,),
                    RaisedButton(
                      color: const Color.fromARGB(255, 255, 153, 51,),
                      onPressed: orderController.powerIsValid ? (){
                        Get.to(
                          MainPhotos(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 100)
                        );
                      } : null ,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: sizeScreen.getWidthScreen(context),
                        child: Text(
                          'Fotos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: orderController.powerIsValid ? 
                            Colors.white : Colors.black,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}