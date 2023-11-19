import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oilproj/widgets/widget_button.dart';
import 'package:oilproj/widgets/widget_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetText(data: 'Profile'),
        WidgetButton(
          data: 'Sign Out',
          pressFunc: () async {
            await GetStorage()
                .erase()
                .then((value) => Get.offAllNamed('/authen'));
          },
        )
      ],
    );
  }
}
