import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/order/checkout/common/info_const.dart';


class PhotosInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: GetBuilder<OrderController>(
          builder: (orderController){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Fotos',
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
                        title: 'Fotos da conta',
                        info: orderController.imagesAccount.length.toString(),
                        icon: Icons.photo_album,
                      ),
                    ),
                    Expanded(
                      child: InfoConst(
                        title: 'Disjuntor',
                        info: orderController.imagesDisjuntor.length.toString(),
                        icon: Icons.settings,
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
                        title: 'Entrada',
                        info: orderController.imagesEntry.length.toString(),
                        icon: Icons.map,
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
                        title: 'Inversor',
                        info: orderController.inversorPhotos.length.toString(),
                        icon: Icons.loop,
                      ),
                    ),
                    Expanded(
                      child: InfoConst(
                        title: 'Placas',
                        info: orderController.platePhotos.length.toString(),
                        icon: Icons.view_array,
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