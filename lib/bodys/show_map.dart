import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oilproj/utility/app_controller.dart';
import 'package:oilproj/widgets/widget_text.dart';

class ShowMap extends StatefulWidget {
  const ShowMap({super.key});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return appController.positions.isEmpty ?  const SizedBox()  : WidgetText(data: appController.positions.last.toString());
    });
  }
}
