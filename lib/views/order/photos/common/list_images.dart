import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/controllers/order/order_controller.dart';


class ListImages extends StatelessWidget {

  final File path;
  final int index;
  final Function(int) remove;

  const ListImages({
    @required this.path,
    @required this.index,
    @required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (orderController){
        return GestureDetector(
          onLongPress: (){
            showDialog(
              context: context,
              child: AlertDialog(
                title: const Text('Tem certeza?'),
                content: const Text('Realmente deseja remover a imagem?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancelar'
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      remove(index);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Remover',
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Image.file(
            path,
            fit: BoxFit.cover,
          ),
        );
      }
    );
  }
}