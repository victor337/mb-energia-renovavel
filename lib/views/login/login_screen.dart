import 'package:flutter/material.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/views/login/components/card_fields.dart';


class LoginScreen extends StatelessWidget {
  
  final SizeScreen sizeScreen = SizeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Text(
              'Login'
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: sizeScreen.getHeightScreenWidthAppBar(context, AppBar()),
          width: sizeScreen.getWidthScreen(context),
          padding: const EdgeInsets.all(15),
          color: const Color.fromARGB(255, 44, 50, 84),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: sizeScreen.getHeightScreen(context) / 7,
                  child: const FadeInImage(
                    placeholder: AssetImage('assets/transparent.png'),
                    image: AssetImage('assets/logo-mb.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 55,),
                CardFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}