import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:oilproj/models/database_model.dart';

class AppController extends GetxController {
  RxInt indexBody = 0.obs;

  RxList<Position> positions = <Position>[].obs;

  RxList<File> files = <File>[].obs;

  RxList<DatabaseModel> databaseModels = <DatabaseModel>[].obs;
  RxList<DatabaseModel?> chooseDatabaseModels = <DatabaseModel?>[null].obs;
}
