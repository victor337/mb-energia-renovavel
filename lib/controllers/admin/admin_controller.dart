import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {

  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> createUser({
    @required String email,
    @required String pass,
    @required String name,
    @required bool isAdmin,
    @required Function onSucess,
    @required Function(String) onFail,
  }) async{
    isLoading = true;
    update();

    auth.createUserWithEmailAndPassword(
      email: email,
      password: pass
    ).then((user) async{
      final Map<String, dynamic> saveUser = {
        'uid': user.user.uid,
        'name': name,
        'email': email,
      };
      await saveUserFire(saveUser, isAdmin);
      isLoading = false;
      onSucess();
      update();
    }).catchError((e){
      isLoading = false;
      onFail(e.code.toString());
      update();
    });
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> saveUserFire(Map<String, dynamic> user, bool isAdmin) async{
    await firestore.collection("users").document(user['uid'] as String).setData(user);
    if(isAdmin){
      await firestore.collection("admins").document(user['uid'] as String).setData(user);
    }
  }

}