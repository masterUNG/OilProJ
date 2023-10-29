import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oilproj/bodys/add_tree.dart';
import 'package:oilproj/bodys/profile.dart';
import 'package:oilproj/bodys/show_map.dart';
import 'package:oilproj/utility/app_controller.dart';
import 'package:oilproj/widgets/widget_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'MapTree',
    'AddTree',
    'MyProfile',
  ];

  var iconDatas = <IconData>[
    Icons.map,
    Icons.park,
    Icons.perm_identity,
  ];

  var bodys = <Widget>[
    const ShowMap(),
    const AddTree(),
    const Profile(),
  ];

  AppController appController = Get.put(AppController());

  var items = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(iconDatas[i]),label: titles[i]
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: WidgetText(data: titles[appController.indexBody.value]),
        ),
        body: bodys[appController.indexBody.value],
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: appController.indexBody.value,
          onTap: (value) {
            appController.indexBody.value = value;
          },
        ),
      );
    });
  }
}
