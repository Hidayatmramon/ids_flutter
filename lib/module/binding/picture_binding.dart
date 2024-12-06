// ignore_for_file: unnecessary_import

import 'package:get/get.dart';
import 'package:ids_project/core.dart';
import 'package:ids_project/module/controller/detail_picture_controller.dart';
import 'package:ids_project/module/controller/list_picture_controller.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListPictureController());
    Get.lazyPut(() => DetailPictureController());
  }
}
