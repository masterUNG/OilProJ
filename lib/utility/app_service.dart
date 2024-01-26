import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
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

    await dio.Dio().get(urlApi).then((value) {
      // print('##15dec value จาก api --> $value');

      for (var element in json.decode(value.data)) {
        DatabaseModel databaseModel = DatabaseModel.fromMap(element);
        appController.databaseModels.add(databaseModel);
      }

      print(
          '##15dec ขนาดของ databaseModels ---> ${appController.databaseModels.length}');
    });
  }

  Future<void> insertNewTree({
    required String idRec,
    required String idTree,
    required String nameTree,
    required String urlImage,
    required String lat,
    required String lng,
    required String dateTimeRec,
  }) async {
    await findUrlUploadImage().then((value)async {
       String urlAPI =
        'https://www.androidthai.in.th/edumall/oil/insertTree.php?isAdd=true&idRec=$idRec&idTree=$idTree&nameTree=$nameTree&urlImage=$value&lat=$lat&lng=$lng&dateTimeRec=$dateTimeRec';

    await dio.Dio().get(urlAPI).then((value) {
      Get.snackbar('Insert Tree Success', 'Inser Tree Data Success',
          backgroundColor: GFColors.INFO);
    });
    });
  }

  Future<String> findUrlUploadImage() async {
    String urlAPI = 'https://www.androidthai.in.th/edumall/oil/saveFile.php';
    String nameFile = 'image${Random().nextInt(1000)}.jpg';

    Map<String, dynamic> map = {};
    map['file'] = await dio.MultipartFile.fromFile(
        appController.files.last.path,
        filename: nameFile);

    dio.FormData formData = dio.FormData.fromMap(map);

    await dio.Dio().post(urlAPI, data: formData);

    return 'https://www.androidthai.in.th/edumall/oil/image/$nameFile';
  }
}
