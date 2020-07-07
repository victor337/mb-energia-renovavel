import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';


class EnergyScreen extends StatelessWidget {

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
                return ListView.builder(
                  itemBuilder: null
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}