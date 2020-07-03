import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/views/home/home_screen.dart';


void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    locale: Locale('pt', 'BR'),
    getPages: [
      GetPage(name: '/splash', page: () => HomeScreen()),
    ],
  ));
}