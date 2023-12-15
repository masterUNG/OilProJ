// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oilproj/utility/app_constant.dart';
import 'package:oilproj/utility/app_controller.dart';
import 'package:oilproj/utility/app_service.dart';
import 'package:oilproj/widgets/widget_icon_button.dart';
import 'package:oilproj/widgets/widget_image.dart';
import 'package:oilproj/widgets/widget_text.dart';

class AddTree extends StatefulWidget {
  const AddTree({super.key});

  @override
  State<AddTree> createState() => _AddTreeState();
}

class _AddTreeState extends State<AddTree> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WidgetText(data: appController.positions.last.toString()),
        displayImage(),
        cameraButton(),
        dropdownNameTree(),
      ],
    );
  }

  Obx dropdownNameTree() {
    return Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: AppConstant().borderBox(),
              width: 250,
              child: DropdownButton(
                isExpanded: true,
                underline: const SizedBox(),
                hint: const WidgetText(data: 'Please Choose Name'),
                value: appController.chooseDatabaseModels.last,
                items: appController.databaseModels
                    .map(
                      (element) => DropdownMenuItem(
                        child: WidgetText(data: element.name),
                        value: element,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  appController.chooseDatabaseModels.add(value);
                },
              ),
            ),
          ],
        );
      });
  }

  Row cameraButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              WidgetIconButton(
                iconData: Icons.add_a_photo,
                pressFunc: () {
                  AppService().processTakePhoto();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget displayImage() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: AppConstant().borderBox(),
            child: appController.files.isEmpty
                ? const WidgetImage(
                    size: 250,
                  )
                : Image.file(
                    appController.files.last,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
          ),
        ],
      );
    });
  }
}
