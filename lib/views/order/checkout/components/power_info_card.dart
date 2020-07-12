import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/order/checkout/common/info_const.dart';


class PowerInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: GetBuilder<OrderController>(
          builder: (orderController){
            return Column(
              children: <Widget>[
                const Text(
                  'Dados da usina solar',
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: InfoConst(
                        title: 'Tipo',
                        info: orderController.typePower,
                        icon: Icons.merge_type,
                      ),
                    ),
                    if(orderController.typePower == 'Telhado')
                      Expanded(
                        child: InfoConst(
                          title: 'Tipo do telhado',
                          info: orderController.typeRoof,
                          icon: Icons.room,
                        ),
                      ),
                    Expanded(
                      child: InfoConst(
                        title: 'Posição',
                        info: orderController.optionPositioned,
                        icon: Icons.location_city,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: InfoConst(
                        title: 'Telefone',
                        info: orderController.phone,
                        icon: Icons.phone,
                      ),
                    ),
                    Expanded(
                      child: InfoConst(
                        title: 'Observação',
                        info: orderController.observation??'',
                        icon: Icons.list,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}