import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/views/login/components/custom_form_field.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/order/local_data/local_screen.dart';



class ClientData extends StatelessWidget {

  final FocusNode focusName = FocusNode();
  final FocusNode focusCity = FocusNode();
  final FocusNode focusPhone = FocusNode();
  final FocusNode focusObs = FocusNode();

  final SizeScreen sizeScreen = SizeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dados do cliente',
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 153, 51,),
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
                    Container(
                      height: sizeScreen.getHeightScreen(context) / 7,
                      child: const FadeInImage(
                        placeholder: AssetImage('assets/transparent.png'),
                        image: AssetImage('assets/icon-mb.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    CustomFormField(
                      focusNode: focusName,
                      onChanged: (name){
                        orderController.setName(name);
                      },
                      hintText: 'Nome completo',
                      onFieldSubmitted: (name){
                        focusName.unfocus();
                        FocusScope.of(context).requestFocus(focusCity);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.multiline,
                      iconData: Icons.people,
                      enabled: null
                    ),
                    CustomFormField(
                      focusNode: focusCity,
                      onChanged: (city){
                        orderController.setCity(city);
                      },
                      hintText: 'Cidade',
                      onFieldSubmitted: (city){
                        focusCity.unfocus();
                        FocusScope.of(context).requestFocus(focusPhone);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.text,
                      iconData: Icons.location_city,
                      enabled: null
                    ),
                    CustomFormField(
                      focusNode: focusPhone,
                      onChanged: (phone){
                        orderController.setPhone(phone);
                      },
                      hintText: 'Telefone',
                      onFieldSubmitted: (phone){
                        focusPhone.unfocus();
                        FocusScope.of(context).requestFocus(focusObs);
                      },
                      textInputAction: TextInputAction.next,
                      inputformatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      keyBoardType: TextInputType.number,
                      iconData: Icons.phone,
                      enabled: null
                    ),
                    Container(
                      height: 100,
                      child: CustomFormField(
                        focusNode: focusObs,
                        onChanged: (obs){
                          orderController.setObs(obs);
                        },
                        hintText: 'Observação',
                        onFieldSubmitted: (obs){
                          focusObs.unfocus();
                        },
                        textInputAction: TextInputAction.done,
                        keyBoardType: TextInputType.multiline,
                        iconData: Icons.list,
                        enabled: null
                      ),
                    ),
                    const SizedBox(height: 20,),
                    RaisedButton(
                      color: const Color.fromARGB(255, 255, 204, 0),
                      disabledColor: const Color.fromARGB(255, 255, 204, 0).withAlpha(90),
                      onPressed: orderController.clietIsValid ? (){
                        Get.to(
                          LocalData(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 100)
                        );
                      } : null ,
                      child: Container(
                        width: sizeScreen.getWidthScreen(context),
                        child: const Text(
                          'Dados do local'
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