import 'package:flutter/material.dart';
import 'package:get/get.dart';

class P2hController extends GetxController {
  final Color warna = const Color.fromARGB(255, 32, 72, 142);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
