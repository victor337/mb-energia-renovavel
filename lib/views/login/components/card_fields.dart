import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/login/login_controller.dart';
import 'package:mbenergiarenovavel/controllers/user/user_controller.dart';
import 'package:mbenergiarenovavel/views/login/components/custom_form_field.dart';


class CardFields extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();

  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPass = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (userController){
        return Card(
          color: const Color.fromARGB(255, 255, 153, 51),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            width: sizeScreen.getWidthScreen(context),
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (loginController){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomFormField(
                      focusNode: focusEmail,
                      onChanged: (email){
                        loginController.setEmail(email);
                      },
                      hintText: 'Email',
                      onFieldSubmitted: (email){
                        focusEmail.unfocus();
                        FocusScope.of(context).requestFocus(focusPass);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.emailAddress,
                      iconData: Icons.email
                    ),
                    CustomFormField(
                      focusNode: focusPass,
                      onChanged: (pass){
                        loginController.setPass(pass);
                      },
                      hintText: 'Senha',
                      onFieldSubmitted: (pass){
                        focusPass.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      keyBoardType: TextInputType.visiblePassword,
                      iconData: Icons.email
                    ),
                    const SizedBox(height: 20,),
                    RaisedButton(
                      onPressed: (){},
                      elevation: 7,
                      color: const Color.fromARGB(255, 255, 204, 0),
                      disabledColor: const Color.fromARGB(255, 200, 200, 200),
                      child: Container(
                        width: sizeScreen.getWidthScreen(context),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'Entrar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}