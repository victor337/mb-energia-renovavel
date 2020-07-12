import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/models/client/local_data_model.dart';
import 'package:mbenergiarenovavel/models/client/person_data_model.dart';
import 'package:mbenergiarenovavel/models/client/power_data_model.dart';
import 'package:path/path.dart';


class CheckoutController extends GetxController {

  bool isLoading = false;

  Future<void> generateExcel({
    @required String path,
    @required PersonData personData,
    @required LocalDataModel localData,
    @required PowerData powerData,
    @required Function onSucess,
    @required Function onFail,
  }) async{
    isLoading = true;
    update();

      final Excel excel = Excel.createExcel();
      final Sheet sheetObject = excel[personData.name];

      //Dados do cliente
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A1"),
        'Dados do cliente'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A3"),
        'Nome completo'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A4"),
        'Cidade'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A5"),
        'Telefone'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A6"),
        'Observação'
      );

      //Valores dados cliente
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("B3"),
        personData.name
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("B4"),
        personData.city
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("B5"),
        personData.phone
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("B6"),
        personData.obs
      );

      //Dados do local
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D1"),
        'Dados do local'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D3"),
        'Tipo'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D4"),
        'Ligação'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D5"),
        'Disjuntor'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D6"),
        'Gerador'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D7"),
        'Observação'
      );

      //Valores dados local
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("E3"),
        localData.type
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("E4"),
        localData.disjuntor
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("E5"),
        localData.generate
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("E6"),
        localData.obs
      );

      //Dados da Usina Solar
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G1"),
        'Dados da Usina Solar',
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G3"),
        'Tipo'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G4"),
        'Telhado'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G5"),
        'Posição'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G6"),
        'M2'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G7"),
        'Localização'
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G8"),
        'Observação'
      );

      //Valores da Usina Solar
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H3"),
        powerData.type
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H4"),
        powerData.typeRoof
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H5"),
        powerData.pos
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H6"),
        powerData.meters
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H7"),
        powerData.location
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H8"),
        powerData.obs,
      );

      try {
        excel.encode().then((onValue){
          File(join("$path/planilha_${personData.name}.xlsx"))
          ..createSync(recursive: true)
          ..writeAsBytesSync(onValue);
        });
        onSucess();
        isLoading = false;
        final Email email = Email(
          body: 'Cliente: ${personData.name}\nVendedor: Victor\nData: ${DateTime.now().toString()}',
          subject: 'Projeto ${personData.name}',
          recipients: ['victorhspb17@gmail.com'],
          cc: ['victorhspb18@gmail.com'],
          bcc: [],
          attachmentPaths: ["$path/planilha_${personData.name}.xlsx"],
          isHTML: false,
        );
        await FlutterEmailSender.send(email);
        update();
      } catch (e){
        onFail();
        isLoading = false;
        update();
      }
    }
}

