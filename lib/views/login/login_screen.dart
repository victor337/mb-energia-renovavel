import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/common/errors/errors.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/controllers/login/login_controller.dart';
import 'package:mbenergiarenovavel/controllers/user/user_controller.dart';
import 'package:mbenergiarenovavel/views/login/components/custom_form_field.dart';


class LoginScreen extends StatelessWidget {
  
  final SizeScreen sizeScreen = SizeScreen();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPass = FocusNode();

  final ErrorsFire errors = ErrorsFire();

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
                GetBuilder<UserController>(
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
                                const SizedBox(height: 15,),
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
                                  enabled: !userController.isLoading,
                                  textInputAction: TextInputAction.next,
                                  keyBoardType: TextInputType.emailAddress,
                                  iconData: Icons.email,
                                  initalValue: '',
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
                                  enabled: !userController.isLoading,
                                  textInputAction: TextInputAction.done,
                                  keyBoardType: TextInputType.visiblePassword,
                                  iconData: Icons.email,
                                  initalValue: '',
                                ),
                                const SizedBox(height: 20,),
                                RaisedButton(
                                  onPressed: userController.isLoading ||
                                  !loginController.isValid ? null : (){
                                    userController.login(
                                      email: loginController.email,
                                      pass: loginController.pass,
                                      onSucess: (){
                                        Get.offNamed('/base');
                                      },
                                      onFail: (e){
                                        Get.snackbar(
                                          'Erro',
                                          errors.setError(e),
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white
                                        );
                                      }
                                    );
                                  },
                                  elevation: 4,
                                  color: const Color.fromARGB(255, 255, 204, 0),
                                  disabledColor: const Color.fromARGB(255, 255, 204, 0).withAlpha(90),
                                  child: Container(
                                    width: sizeScreen.getWidthScreen(context),
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: userController.isLoading ? const Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(Colors.yellow),
                                      ),
                                    ) : const Text(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}