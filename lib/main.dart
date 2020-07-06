import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/views/base/base_screen.dart';
import 'package:mbenergiarenovavel/views/login/login_screen.dart';
import 'package:mbenergiarenovavel/views/splash/splash_screen.dart';


void main() {
  runApp(GetMaterialApp(
    initialRoute: '/splash',
    locale: const Locale('pt', 'BR'),
    getPages: [
      GetPage(
        name: '/splash',
        page: () => SplashScreen()
      ),
      GetPage(
        name: '/login',
        page: () => LoginScreen(),
      ),
      GetPage(
        name: '/base',
        page: () => BaseScreen(),
      ),
    ],
    theme: ThemeData(
      primaryColor: const Color.fromARGB(255, 44, 50, 84),
      fontFamily: 'Nunito'
    ),
  ));
}