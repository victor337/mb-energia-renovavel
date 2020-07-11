import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/revision/common/info_const.dart';


class LocalInfoCard extends StatelessWidget {
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
                  'Dados do local',
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InfoConst(
                      title: 'Tipo',
                      info: orderController.type,
                      icon: Icons.local_convenience_store,
                    ),
                    InfoConst(
                      title: 'Ligação',
                      info: orderController.ligation,
                      icon: Icons.format_line_spacing,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InfoConst(
                      title: 'Disjuntor',
                      info: orderController.disjutor,
                      icon: Icons.settings,
                    ),
                    InfoConst(
                      title: 'Gerador',
                      info: orderController.generator,
                      icon: Icons.assignment_late,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InfoConst(
                  title: 'Observação',
                  info: orderController.observationLocal??'',
                  icon: Icons.list,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}