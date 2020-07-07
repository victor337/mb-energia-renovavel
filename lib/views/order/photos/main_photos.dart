import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/order/checkout/checkout_screen.dart';
import 'package:mbenergiarenovavel/views/order/photos/components/account_photos.dart';
import 'package:mbenergiarenovavel/views/order/photos/components/disjuntor_screen.dart';


class MainPhotos extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();

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
                return Stack(
                  children: <Widget>[
                     PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        AccountPhotos(),
                        DisjuntorPhotos(),
                      ],
                    ),
                    Container(
                      height: sizeScreen.getHeightScreenWidthAppBar(context, AppBar()),
                      width: sizeScreen.getWidthScreen(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: const Color.fromARGB(255, 255, 153, 51,),
                            onPressed: orderController.accountIsValid ? (){
                              Get.to(
                                CheckoutScreen(),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 100)
                              );
                            } : null ,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              width: sizeScreen.getWidthScreen(context),
                              child: Text(
                                'Continuar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: orderController.accountIsValid ? 
                                  Colors.white : Colors.black,
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ),
                        ],
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