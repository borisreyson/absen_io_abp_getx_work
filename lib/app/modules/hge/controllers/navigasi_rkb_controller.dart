import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utils/constants.dart';

class NavigasiRkbController extends GetxController {
  final indexSelect = 0.obs;
  var constants = Constants();
  final status = RxnString(null);
  final listColor = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.red
  ];

  void tapNavigasi(int i) {
    indexSelect.value = i;
  }
}
