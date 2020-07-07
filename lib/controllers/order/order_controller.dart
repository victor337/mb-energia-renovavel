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

  Future<void> getLocal({
    @required Function onFail
  })async{

    isLoading = false;
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

  bool get powerIsValid => typePower != null && typePower != 'Selecione' &&
    typeRoof != null && typeRoof != 'Selecione' && optionPositioned != null &&
    optionPositioned != 'Selecione' && lat != null && lat != '' && long != null && 
    long != '';

  

}