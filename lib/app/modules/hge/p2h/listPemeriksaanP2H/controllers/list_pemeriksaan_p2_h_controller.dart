import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../../../data/models/p2h_pemeriksaan.dart';
import '../../../../../data/providers/p2h_provider.dart';

class ListPemeriksaanP2HController extends GetxController    with GetSingleTickerProviderStateMixin {
  final provider = P2hProvider();
  final data = <P2hPemeriksaan>[].obs;
  final loaded = false.obs;

  late final AnimationController animateController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);
  @override
  void onInit() async {
    var res = await Get.arguments['uniqid'];
    if (res != null) {
      getAllData(res);
    }
    super.onInit();
  }

  getAllData(uniqid) async {
    data.clear();
    await provider.getPemeriksaanUnit(uniqid).then((value) {
      var result = value.p2hPemeriksaaan;
      if (result != null) {
        data.addAll(result);
        loaded.value = true;
      } else {
        loaded.value = false;
      }
    });
  }
}