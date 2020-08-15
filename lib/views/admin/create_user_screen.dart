import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/common/drawer/custom_drawer.dart';
import 'package:mbenergiarenovavel/common/errors/errors.dart';
import 'package:mbenergiarenovavel/constants/size_screen.dart';
import 'package:mbenergiarenovavel/views/login/components/custom_form_field.dart';
import 'package:mbenergiarenovavel/controllers/admin/create_user/create_user.dart';
import 'package:mbenergiarenovavel/controllers/admin/admin_controller.dart';


class CreateUserScreen extends StatelessWidget {

  final SizeScreen sizeScreen = SizeScreen();
  final ErrorsFire errorsFire = ErrorsFire();

  final FocusNode focusName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPass = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar usuário',
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 153, 51,),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          color: const Color.fromARGB(255, 255, 153, 51,),
          height: sizeScreen.getHeightScreenWidthAppBar(context, AppBar()),
          width: sizeScreen.getWidthScreen(context),
          child: GetBuilder<CreateUserController>(
            init: CreateUserController(),
            builder: (createUser){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: avoid_redundant_argument_values
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomFormField(
                      focusNode: focusName,
                      onChanged: (name){
                        createUser.setName(name);
                      },
                      hintText: 'Nome',
                      onFieldSubmitted: (name){
                        focusName.unfocus();
                        FocusScope.of(context).requestFocus(focusEmail);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.text,
                      iconData: Icons.person,
                      enabled: true,
                      initalValue: createUser.name,
                      color: const Color.fromARGB(255, 255, 153, 51,),
                    ),
                    CustomFormField(
                      focusNode: focusEmail,
                      onChanged: (email){
                        createUser.setEmail(email);
                      },
                      hintText: 'Email',
                      onFieldSubmitted: (email){
                        focusEmail.unfocus();
                        FocusScope.of(context).requestFocus(focusPass);
                      },
                      textInputAction: TextInputAction.next,
                      keyBoardType: TextInputType.emailAddress,
                      iconData: Icons.mail,
                      enabled: true,
                      initalValue: createUser.email,
                      color: const Color.fromARGB(255, 255, 153, 51,),
                    ),
                    CustomFormField(
                      focusNode: focusPass,
                      onChanged: (pass){
                        createUser.setPass(pass);
                      },
                      hintText: 'Senha',
                      onFieldSubmitted: (pass){
                        focusPass.unfocus();
                      },
                      textInputAction: TextInputAction.done,
                      keyBoardType: TextInputType.visiblePassword,
                      iconData: Icons.lock,
                      enabled: true,
                      initalValue: createUser.pass,
                      color: const Color.fromARGB(255, 255, 153, 51,),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          activeColor: Colors.yellow,
                          value: createUser.isAdmin,
                          onChanged: (v){
                            createUser.setAdmin();
                          },
                        ),
                        const Text(
                          'Administrador',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    GetBuilder<AdminController>(
                      init: AdminController(),
                      builder: (adminController){
                        return RaisedButton(
                          color: const Color.fromARGB(255, 255, 255, 0),
                          onPressed: !adminController.isLoading ? (){
                            adminController.createUser(
                              email: createUser.email,
                              pass: createUser.pass,
                              name: createUser.name,
                              isAdmin: createUser.isAdmin,
                              onSucess: (){
                                Get.snackbar(
                                  'Sucesso',
                                  'Usuário criado com sucesso',
                                  colorText: Colors.white,
                                  backgroundColor: Colors.green,
                                );
                              },
                              onFail: (e){
                                Get.snackbar(
                                  'Falha',
                                  errorsFire.setError(e),
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              }
                            );
                          } : null,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: adminController.isLoading ? const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              ),
                            ) : 
                            const Text(
                              'Criar usuário',
                              style: TextStyle(
                                color: Colors.black
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          )
        ),
      ),
    );
  }
}