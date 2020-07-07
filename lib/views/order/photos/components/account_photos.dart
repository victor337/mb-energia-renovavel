import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';
import 'package:mbenergiarenovavel/views/order/photos/common/add_tile_widget.dart';
import 'package:mbenergiarenovavel/views/order/photos/components/list_images.dart';


class AccountPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (orderController){
        return Column(
          children: <Widget>[
            Card(
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: const Text(
                  'Fotos da conta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25,),
            StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              crossAxisCount: 4,
              itemCount: orderController.imagesAccount.length + 1,
              itemBuilder: (ctx, index){
                if(index < orderController.imagesAccount.length){
                  return ListImages(orderController.imagesAccount[index], index);
                } else{
                  return AddTileWidget();
                }
              },
              staggeredTileBuilder: (index){
                return StaggeredTile.count(
                  2,
                  index.isEven ? 2 : 1,
                );
              },
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            )
          ],
        );
      }
    );
  }
}