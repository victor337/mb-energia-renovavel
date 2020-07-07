import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/models/user/user_model.dart';


class UserController extends GetxController {

  UserModel user;

  FirebaseAuth auth = FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;
  
  bool isLoading = false;

  Future<void> login({
    @required String email,
    @required String pass,
    @required Function onSucess,
    @required Function(String) onFail
  }) async{

    isLoading = true;
    update();

    auth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    ).then((userLogged)async{
      
      final DocumentSnapshot dataFire = await getData(userLogged.user.uid);

      final UserModel setUser = UserModel(
        name: dataFire.data["name"] as String,
        email: dataFire.data["email"] as String,
      );
      
      user = setUser;
      onSucess();
      isLoading = false;
      update();
    }).catchError((e){
      onFail(e.code.toString());
      isLoading = false;
      update();
    });
  }

  Future<DocumentSnapshot> getData(String uid) async{
    final DocumentSnapshot doc = await firestore.collection("users").document(uid).get();
    return doc;
  }
  
}