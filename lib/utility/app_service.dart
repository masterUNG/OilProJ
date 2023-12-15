import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oilproj/models/database_model.dart';
import 'package:oilproj/utility/app_controller.dart';
import 'package:oilproj/utility/app_dialog.dart';
import 'package:oilproj/widgets/widget_text_button.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> processFindPosition() async {
    bool locationService = await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission;

    if (locationService) {
      //Open Service Location

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        //ไม่อนุญาติเลย
        dialogCallPermission();
      } else {
        //Away, OneInUser, Denied

        if (locationPermission == LocationPermission.denied) {
          //ยังไม่รู้

          locationPermission = await Geolocator.requestPermission();
          if ((locationPermission != LocationPermission.always) &&
              (locationPermission != LocationPermission.whileInUse)) {
            //ไม่อนุญาติ
            dialogCallPermission();
          } else {
            Position position = await Geolocator.getCurrentPosition();
            appController.positions.add(position);
          }
        } else {
          //Away, OneInUse
          Position position = await Geolocator.getCurrentPosition();
          appController.positions.add(position);
        }
      }
    } else {
      //Off Service Location
      AppDialog().normalDialog(
          title: 'Please Open Location',
          actionWidget: WidgetTextButton(
            data: 'Open Location',
            pressFunc: () {
              Geolocator.openLocationSettings();
              exit(0);
            },
          ));
    }
  }
  //test git

  void dialogCallPermission() {
    AppDialog().normalDialog(
        title: 'Please Open Permission',
        actionWidget: WidgetTextButton(
          data: 'Open Permission',
          pressFunc: () {
            Geolocator.openAppSettings();
            exit(0);
          },
        ));
  }

  Future<void> processTakePhoto() async {
    var result = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 800, maxHeight: 800);

    if (result != null) {
      File file = File(result.path);
      appController.files.add(file);
    }
  }

  Future<void> readAllTreeDatabase() async {
    if (appController.databaseModels.isNotEmpty) {
      appController.databaseModels.clear();
    }
    String urlApi =
        'https://www.androidthai.in.th/edumall/oil/getAlldatabase.php';

    await Dio().get(urlApi).then((value) {
      // print('##15dec value จาก api --> $value');

      for (var element in json.decode(value.data)) {
        DatabaseModel databaseModel = DatabaseModel.fromMap(element);
        appController.databaseModels.add(databaseModel);
      }

      print(
          '##15dec ขนาดของ databaseModels ---> ${appController.databaseModels.length}');
    });
  }
}
