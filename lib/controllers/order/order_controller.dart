import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';


class OrderController extends GetxController {

  String name;
  void setName(String setName){
    name = setName;
    update();
  }

  String city;
  void setCity(String setCity){
    city = setCity;
    update();
  }

  String phone;
  void setPhone(String setPhone){
    phone = setPhone;
    update();
  }

  String observation;
  void setObs(String setObs){
    observation = setObs;
    update();
  }

  bool get clietIsValid => name != null && name != '' && city != null && city != '' &&
    phone != null && phone != '' && phone.length >= 14 ;

  String disjutor;
  void setDis(String setDis){
    disjutor = setDis;
    update();
  }

  String type;
  void setType(String setType){
    type = setType;
    update();
  }

  String ligation;
  void setLigation(String setLigation){
    ligation = setLigation;
    update();
  }

  String generator;
  void setGenerator(String setGenerator){
    generator = setGenerator;
    update();
  }

  String observationLocal;
  void setObsLocal(String setObs){
    observationLocal = setObs;
    update();
  }

  bool get localIsValid => disjutor != null && disjutor != '' &&
    type != null && type != 'Selecione' && ligation != null && 
    ligation != 'Selecione' && generator != null && generator != 'Selecione';


  String typePower;
  void setTypePower(String setTypePower){
    typePower = setTypePower;
    update();
  }

  String typeRoof;
  void setTypeRoof(String setTypeRoof){
    typeRoof = setTypeRoof;
    update();
  }

  String optionPositioned;
  void setOptionPositioned(String setOptionPositioned){
    optionPositioned = setOptionPositioned;
    update();
  }

  String meters;
  void setMeters(String setMeters){
    meters = setMeters;
    update();
  }

  String observationPower;
  void setObsPower(String setObs){
    observationPower = setObs;
    update();
  }

  String lat;
  void setLat(String setLat){
    lat = setLat;
    update();
  }

  String long;
  void setLong(String setLong){
    long = setLong;
    update();
  }

  bool isLoading = false;
  bool imageisLoading = false;

  Future<void> getLocal({
    @required Function onFail
  })async{

    isLoading = true;
    update();

    final Location location =  Location();

    bool _serviceEnabled;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    await PermissionHandler().requestPermissions([
      PermissionGroup.location
    ]);

     PermissionHandler().checkPermissionStatus(
      PermissionGroup.storage
    ).then((value)async{

      _locationData = await location.getLocation();
      setLat(_locationData.latitude.toString());
      setLong(_locationData.longitude.toString());

      isLoading = false;
      update();

    }).catchError((e){

      isLoading = false;
      onFail();
      update();

    });
  }

  bool get powerIsValid => typePower != 'Selecione' &&  optionPositioned != 'Selecione' &&
  lat != null && long != null && typePower != null &&  optionPositioned != null ||
  typePower == 'Telhado' && typeRoof != 'Selecione' && optionPositioned != 'Selecione' &&
  typePower == null && typeRoof != null && optionPositioned != null;


  List<File> imagesAccount = [];

  void addImageAccount(File path){
    imageisLoading = true;
    update();
    imagesAccount.add(path);
    imageisLoading = false;
    update();
  }

  void removeImageAccount(int index){
    imagesAccount.removeAt(index);
    update();
  }

  List<File> imagesDisjuntor = [];

  void addImageDisjuntor(File path){
    imageisLoading = true;
    update();
    imagesDisjuntor.add(path);
    imageisLoading = false;
    update();
  }

  void removeImageDisjuntor(int index){
    imagesDisjuntor.removeAt(index);
    update();
  }

  List<File> imagesEntry = [];

  void addImagesEntry(File path){
    imageisLoading = true;
    update();
    imagesEntry.add(path);
    imageisLoading = false;
    update();
  }

  void removeImagesEntry(int index){
    imagesEntry.removeAt(index);
    update();
  }

  List<File> inversorPhotos = [];

  void addinversorPhotos(File path){
    imageisLoading = true;
    update();
    inversorPhotos.add(path);
    imageisLoading = false;
    update();
  }

  void removeinversorPhotos(int index){
    inversorPhotos.removeAt(index);
    update();
  }

  List<File> platePhotos = [];

  void addPlatePhotos(File path){
    imageisLoading = true;
    update();
    platePhotos.add(path);
    imageisLoading = false;
    update();
  }

  void removePlatePhotos(int index){
    platePhotos.removeAt(index);
    update();
  }

  bool accountIsValid(){
    if(index == 0 && imagesAccount.isNotEmpty){
      return true;
    } else if(index == 1 && imagesDisjuntor.isNotEmpty){
      return true;
    } else if(index == 2 && imagesEntry.isNotEmpty){
      return true;
    } else if(index == 3 && inversorPhotos.isNotEmpty){
      return true;
    } else if(index == 4 && platePhotos.isNotEmpty){
      return true;
    } else{
      return false;
    }
  }

  final PageController pageController = PageController();
  int index = 0;

  void setPage(int newIndex){
    index = newIndex;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear
    );
    update();
  }

}