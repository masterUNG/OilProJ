import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
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
}
