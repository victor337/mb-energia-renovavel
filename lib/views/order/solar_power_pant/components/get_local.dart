import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';



class GetLocal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (orderController){
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Latitude: ${orderController.lat??'Clique em buscar'}\n'
                          'Longitude: ${orderController.long??'Clique em buscar'}'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                RaisedButton(
                  onPressed: (){
                    orderController.getLocal(
                      onFail: (){
                        Get.snackbar(
                          'Erro',
                          'Não foi possível localizar',
                          backgroundColor: Colors.red
                        );
                      }
                    );
                  },
                  color: const Color.fromARGB(255, 255, 153, 51,),
                  child: orderController.isLoading ?
                  const Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                  ),) :
                  const Text(
                    'Buscar',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: orderController.lat != null 
              && orderController.long != null,
              child: RaisedButton(
                color: const Color.fromARGB(255, 255, 153, 51,),
                onPressed: (){
                  launch('https://www.google.com/maps/search/?api=1&query='
                  '${orderController.lat},${orderController.long}');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Ver no Maps',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}