import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oilproj/widgets/widget_button.dart';
import 'package:oilproj/widgets/widget_form.dart';
import 'package:oilproj/widgets/widget_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Create New Account'),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        WidgetForm(
                          textEditingController: nameController,
                          labelWidget: const WidgetText(data: 'Name :'),
                          validateFunc: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return 'Please Fill Name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        WidgetForm(
                          textEditingController: userController,
                          labelWidget: const WidgetText(data: 'User :'),
                          validateFunc: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return 'Please Fill User';
                            } else {
                              return null;
                            }
                          },
                        ),
                        WidgetForm(
                          textEditingController: passwordController,
                          labelWidget: const WidgetText(data: 'Password :'),
                          validateFunc: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return 'Please Fill Password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        WidgetButton(
                          data: 'Create New Account',
                          pressFunc: () async {
                            if (formKey.currentState!.validate()) {
                              //Check User
                              String urlCheckUser =
                                  'https://www.androidthai.in.th/edumall/oil/getUserWhereUser.php?isAdd=true&user=${userController.text}';

                              await Dio().get(urlCheckUser).then((value) async {
                                if (value.toString() == 'null') {
                                  //User Pass

                                  String urlInsertUser =
                                      'https://www.androidthai.in.th/edumall/oil/insertUser.php?isAdd=true&name=${nameController.text}&user=${userController.text}&password=${passwordController.text}';
                                  await Dio().get(urlInsertUser).then((value) {
                                    Get.back();
                                    Get.snackbar('Creage New Account Success',
                                        'Welcome to My App Please Login');
                                  });
                                } else {
                                  Get.snackbar(
                                      'User ซ้ำ', 'กรุณาเปลี่ยน User ด้วยคะ');
                                }
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
