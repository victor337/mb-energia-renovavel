import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/login/components/custom_form_field.dart';
import 'package:mbenergiarenovavel/common/order/dropdown.dart';
import 'package:mbenergiarenovavel/views/order/solar_power_pant/solar_power_screen.dart';


class LocalData extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();

  final FocusNode focusDis= FocusNode();
  final FocusNode focusObs = FocusNode();

  final List<String> optionsType = 
    ['Selecione', 'Industria', 'Empresa', 'Residência', 'Granja', 'Sítio', 'Fazenda'];

  final List<String> optionsLigation = 
    ['Selecione', 'Mono', 'Bifásico', 'Trifásico', 'Grupo A'];
  
  final List<String> optionsGenerator = 
    ['Selecione', 'Sim', 'Não',];

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color.fromARGB(255, 255, 153, 51,),
                Color.fromARGB(255, 255, 204, 0),
              ]
            ),
          ),
          child: Center(
            child: GetBuilder<OrderController>(
              builder: (orderController){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: const Text(
                          'Dados do local',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        DropDown(
                          title: 'Tipo',
                          options: optionsType,
                          onChanged: orderController.setType,
                          value: orderController.type??'Selecione',
                        ),
                        DropDown(
                          title: 'Ligação',
                          options: optionsLigation,
                          onChanged: orderController.setLigation,
                          value: orderController.ligation??'Selecione',
                        ),
                        DropDown(
                          title: 'Gerador',
                          options: optionsGenerator,
                          onChanged: orderController.setGenerator,
                          value: orderController.generator??'Selecione',
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    CustomFormField(
                      focusNode: focusDis,
                      onChanged: (dis){
                        orderController.setDis(dis);
                      },
                      hintText: 'Disjutor',
                      onFieldSubmitted: (dis){
                        focusDis.unfocus();
                        FocusScope.of(context).requestFocus(focusObs);
                      },
                      initalValue: orderController.disjutor??'',
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
                          orderController.setObsLocal(obs);
                        },
                        hintText: 'Observação',
                        onFieldSubmitted: (obs){
                          focusObs.unfocus();
                        },
                        initalValue: orderController.observationLocal??'',
                        textInputAction: TextInputAction.done,
                        keyBoardType: TextInputType.multiline,
                        iconData: Icons.list,
                        enabled: null
                      ),
                    ),
                    const SizedBox(height: 20,),
                    RaisedButton(
                      color: const Color.fromARGB(255, 255, 153, 51,),
                      onPressed: orderController.localIsValid ? (){
                        Get.to(
                          SolarPowerScreen(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 100)
                        );
                      } : null ,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: sizeScreen.getWidthScreen(context),
                        child: Text(
                          'Dados da Usina solar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: orderController.localIsValid ? 
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