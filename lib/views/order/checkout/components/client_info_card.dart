import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/order/checkout/common/info_const.dart';


class ClientInfoCard extends StatelessWidget {
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
                  'Dados do cliente',
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
                        title: 'Nome completo',
                        info: orderController.name,
                        icon: Icons.person,
                      ),
                    ),
                    Expanded(
                      child: InfoConst(
                        title: 'Cidade',
                        info: orderController.city,
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