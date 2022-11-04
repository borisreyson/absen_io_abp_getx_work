import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_absen_controller.dart';

class NavListAbsenController extends GetxController {
  final listAbsenController = Get.find<ListAbsenController>();
  final indexSelect = 0.obs;
  final bgColor = const Color.fromARGB(255, 7, 83, 9).obs;

  @override
  void onClose() {}
  void tapNavigasi(index) async {
    indexSelect.value = index;
    switch (index) {
      case 0:
        bgColor.value = const Color.fromARGB(255, 7, 83, 9);
        listAbsenController.status.value = "masuk";
        break;
      case 1:
        listAbsenController.status.value = "pulang";
        bgColor.value = const Color.fromARGB(255, 140, 5, 5);
        // getPref('absensi');
        break;

      default:
        listAbsenController.status.value = "masuk";
        bgColor.value = const Color.fromARGB(255, 7, 83, 9);

        // Get.offAllNamed('/home');
        break;
    }
    var hal = listAbsenController.page.value = 1;
    listAbsenController.listAbsen.clear();
    listAbsenController.loadListAbsen(hal);
  }
}
