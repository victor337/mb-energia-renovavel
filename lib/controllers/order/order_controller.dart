import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';



class OrderController extends GetxController {

  void cleanAll(){
    pathsImages.clear();
    name = null;
    city = null;
    phone = null;
    observation = null;
    disjutor = null;
    type = null;
    ligation = null;
    meters = null;
    generator = null;
    observationLocal = null;
    typePower = null;
    typeRoof = null;
    imagesAccount.clear();
    imagesDisjuntor.clear();
    imagesEntry.clear();
    inversorPhotos.clear();
    platePhotos.clear();
    lat = null;
    long = null;
    observationPower = null;
    setPage(0);
  }

  List<String> pathsImages = [];

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
  void setLoadingImages(){
    imageisLoading = !imageisLoading;
    update();
  }

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
    await Permission.location.request();


    if(await Permission.location.request().isDenied){
      return Get.snackbar(
        'Erro',
        'É necessário permirtir para executar essa função',
      );
    }

    try {
      _locationData = await location.getLocation();
      setLat(_locationData.latitude.toString());
      setLong(_locationData.longitude.toString());

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      onFail();
      update();
    }
  
  }

  bool get powerIsValid => typePower != 'Selecione' &&  optionPositioned != 'Selecione' &&
  lat != null && long != null && typePower != null &&  optionPositioned != null ||
  typePower == 'Telhado' && typeRoof != 'Selecione' && optionPositioned != 'Selecione' &&
  typePower == null && typeRoof != null && optionPositioned != null;


  List<File> imagesAccount = [];

  void addImageAccount(File path){
    imagesAccount.add(path);
    pathsImages.add(path.path);
    update();
  }

  void removeImageAccount(int index){
    imagesAccount.removeAt(index);
    pathsImages.removeAt(index);
    update();
  }

  List<File> imagesDisjuntor = [];

  void addImageDisjuntor(File path){
    imagesDisjuntor.add(path);
    pathsImages.add(path.path);
    update();
  }

  void removeImageDisjuntor(int index){
    imagesDisjuntor.removeAt(index);
    pathsImages.removeAt(index);
    update();
  }

  List<File> imagesEntry = [];

  void addImagesEntry(File path){
    imagesEntry.add(path);
    pathsImages.add(path.path);
    update();
  }

  void removeImagesEntry(int index){
    imagesEntry.removeAt(index);
    pathsImages.removeAt(index);
    update();
  }

  List<File> inversorPhotos = [];

  void addinversorPhotos(File path){
    inversorPhotos.add(path);
    pathsImages.add(path.path);
    update();
  }

  void removeinversorPhotos(int index){
    inversorPhotos.removeAt(index);
    pathsImages.removeAt(index);
    update();
  }

  List<File> platePhotos = [];

  void addPlatePhotos(File path){
    platePhotos.add(path);
    pathsImages.add(path.path);
    update();
  }

  void removePlatePhotos(int index){
    platePhotos.removeAt(index);
    pathsImages.removeAt(index);
    update();
  }

  // bool accountIsValid(){
  //   if(index == 0 && imagesAccount.isNotEmpty){
  //     return true;
  //   } else if(index == 1 && imagesDisjuntor.isNotEmpty){
  //     return true;
  //   } else if(index == 2 && imagesEntry.isNotEmpty){
  //     return true;
  //   } else if(index == 3 && inversorPhotos.isNotEmpty){
  //     return true;
  //   } else if(index == 4 && platePhotos.isNotEmpty){
  //     return true;
  //   } else{
  //     return false;
  //   }
  // }

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