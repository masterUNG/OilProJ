import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:oilproj/utility/app_dialog.dart';
import 'package:oilproj/widgets/widget_text_button.dart';

class AppService {
  Future<void> processFindPosition() async {
    bool locationService = await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission;

    if (locationService) {
      //Open Service Location

        






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
}
