import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:mbenergiarenovavel/models/client/local_data_model.dart';
import 'package:mbenergiarenovavel/models/client/person_data_model.dart';
import 'package:mbenergiarenovavel/models/client/power_data_model.dart';
import 'package:mbenergiarenovavel/models/user/user_model.dart';
import 'package:path/path.dart';


class CheckoutController extends GetxController {

  bool isLoading = false;

  Future<void> generateExcel({
    @required List<String> images,
    @required String path,
    @required PersonData personData,
    @required LocalDataModel localData,
    @required PowerData powerData,
    @required Function onSucess,
    @required Function onFail,
    @required UserModel userModel,
  }) async{
    isLoading = true;
    update();

      final Excel excel = Excel.createExcel();
      final Sheet sheetObject = excel[personData.name];

      //Dados do cliente
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A1"),
        'Dados do cliente',
        cellStyle: CellStyle(
          backgroundColorHex: '#FFFF00',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      sheetObject.merge(
        CellIndex.indexByString("A1"),
        CellIndex.indexByString("D1"),
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A2"),
        'Nome completo',
        cellStyle: CellStyle(
          backgroundColorHex: '#FFFF00',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("B2"),
        'Cidade',
        cellStyle: CellStyle(
          backgroundColorHex: '#FFFF00',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("C2"),
        'Telefone',
        cellStyle: CellStyle(
          backgroundColorHex: '#FFFF00',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D2"),
        'Observação',
        cellStyle: CellStyle(
          backgroundColorHex: '#FFFF00',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );

      //Valores dados cliente
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("A3"),
        personData.name,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("B3"),
        personData.city,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("C3"),
        personData.phone,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("D3"),
        personData.obs,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );

      //Dados do local
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("E1"),
        'Dados do Local',
        cellStyle: CellStyle(
          backgroundColorHex: '#7AD694',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      sheetObject.merge(
        CellIndex.indexByString("E1"),
        CellIndex.indexByString("I1"),
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("E2"),
        'Tipo',
        cellStyle: CellStyle(
          backgroundColorHex: '#7AD694',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("F2"),
        'Ligação',
        cellStyle: CellStyle(
          backgroundColorHex: '#7AD694',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G2"),
        'Disjuntor',
        cellStyle: CellStyle(
          backgroundColorHex: '#7AD694',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H2"),
        'Gerador',
        cellStyle: CellStyle(
          backgroundColorHex: '#7AD694',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("I2"),
        'Observação',
        cellStyle: CellStyle(
          backgroundColorHex: '#7AD694',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );

      //Valores dados local
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("E3"),
        localData.type,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("F3"),
        localData.ligation,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("G3"),
        localData.disjuntor,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("H3"),
        localData.generate,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("I3"),
        localData.obs,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );

      //Dados da Usina Solar
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("J1"),
        'Dados da Usina Solar',
        cellStyle: CellStyle(
          backgroundColorHex: '#8cb5f9',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      sheetObject.merge(
        CellIndex.indexByString("J1"),
        CellIndex.indexByString("O1"),
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("J2"),
        'Tipo',
        cellStyle: CellStyle(
          backgroundColorHex: '#8cb5f9',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("K2"),
        'Telhado',
        cellStyle: CellStyle(
          backgroundColorHex: '#8cb5f9',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("L2"),
        'Posição',
        cellStyle: CellStyle(
          backgroundColorHex: '#8cb5f9',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("M2"),
        'M2',
        cellStyle: CellStyle(
          backgroundColorHex: '#8cb5f9',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("N2"),
        'Localização',
        cellStyle: CellStyle(
          backgroundColorHex: '#8cb5f9',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("O2"),
        'Observação',
        cellStyle: CellStyle(
          backgroundColorHex: '#8cb5f9',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );

      //Valores da Usina Solar
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("J3"),
        powerData.type,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("K3"),
        powerData.typeRoof,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("L3"),
        powerData.pos,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("M3"),
        powerData.meters,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("N3"),
        powerData.location,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("O3"),
        powerData.obs,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );

      //Dados do usuário
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("P1"),
        'Projeto',
        cellStyle: CellStyle(
          backgroundColorHex: '#ff6d01',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      sheetObject.merge(
        CellIndex.indexByString("P1"),
        CellIndex.indexByString("Q1"),
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("P2"),
        'Data',
        cellStyle: CellStyle(
          backgroundColorHex: '#ff6d01',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("Q2"),
        'Usuário',
        cellStyle: CellStyle(
          backgroundColorHex: '#ff6d01',
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );

      //Valores
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("P3"),
        setDate(DateTime.now().toString()),
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );
      excel.updateCell(
        sheetObject.sheetName,
        CellIndex.indexByString("Q3"),
        userModel.name,
        cellStyle: CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: HorizontalAlign.Center,
        )
      );


      excel.delete('Sheet1');

      try {
        excel.encode().then((onValue){
          File(join("$path/planilha_${personData.name}.xlsx"))
          ..createSync(recursive: true)
          ..writeAsBytesSync(onValue);
        });
        onSucess();
        images.add("$path/planilha_${personData.name}.xlsx");
        final Email email = Email(
          body: 'Cliente: ${personData.name}\nVendedor: ${userModel.name}\nData: ${setDate(DateTime.now().toString())}',
          subject: 'Projeto ${personData.name}',
          recipients: ['mberorcamento@gmail.com'],
          cc: [],
          bcc: [],
          attachmentPaths: images,
        );
        isLoading = false;
        await FlutterEmailSender.send(email);
        update();
      } catch (e){
        onFail();
        isLoading = false;
        update();
      }
    }


    String setDate(String date){
      final String year = date.substring(0, 4);
      final String month = date.substring(6, 7);
      final String day = date.substring(8, 10);
      final String hrs = date.substring(11, 16);
      return '$day/$month/$year, ${hrs}hrs';
    }
}

