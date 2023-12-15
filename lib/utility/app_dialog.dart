import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oilproj/widgets/widget_text.dart';
import 'package:oilproj/widgets/widget_text_button.dart';

class AppDialog {

  void normalDialog({
    required String title,
    Widget? actionWidget,
  }) {
    Get.dialog(AlertDialog(
      title: WidgetText(data: title),
      actions: [
        actionWidget ??
            WidgetTextButton(
              data: 'OK',
              pressFunc: () {
                Get.back();
              },
            )
      ],
    ));
  }

  void gfAlert() {
    
  }
}
