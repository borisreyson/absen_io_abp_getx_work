import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ImageHazardViewController extends GetxController {
  final urlImg = ''.obs;
  final title = "boris".obs;
  final loaded = false.obs;
  final rkbImage = false.obs;
  @override
  void onInit() async {
    urlImg.value = Get.arguments['image'];
    loaded.value = Get.arguments['loaded'];
    var rkb = Get.arguments['rkbImage'];
    if (rkb != null) {
      rkbImage.value = Get.arguments['rkbImage'];
    }
    if (kDebugMode) {
      print("urlImg.value  ${urlImg.value}");
    }
    if (kDebugMode) {
      print("urlImg.value  ${loaded.value}");
    }
    if (kDebugMode) {
      print("urlImg.value  ${rkbImage.value}");
    }
    super.onInit();
  }

  @override
  void onClose() {}
}
