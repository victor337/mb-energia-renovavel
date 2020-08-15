import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/common/drawer/custom_drawer.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/views/order/client_data/client_data.screen.dart';


class HomeScreen extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Início',
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 153, 51,),
      ),
      drawer: CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 153, 51,),
              Color.fromARGB(255, 255, 204, 0),
            ]
          ),
        ),
        child: Center(
          child: Card(
            child: ListTile(
              onTap: (){
                Get.to(
                  ClientData(),
                  transition: Transition.topLevel,
                  duration: const Duration(milliseconds: 250),
                );
              },
              leading: const Icon(
                Icons.person_add,
                color: Color.fromARGB(255, 153, 204, 102),
              ),
              title: const Text(
                'Novo cliente',
              ),
              subtitle: const Text(
                'Adicionar novo cliente e enviar a planilha por email',
              ),
              trailing: const Icon(Icons.arrow_right),
            ),
          ),
        ),
      ),
    );
  }
}