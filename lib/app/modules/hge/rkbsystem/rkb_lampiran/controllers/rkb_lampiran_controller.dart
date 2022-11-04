// ignore_for_file: unnecessary_null_comparison

import 'package:face_id_plus/app/data/models/lampiran_rkb.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/providers/provider.dart';

class RkbLampiranController extends GetxController {
  final provider = Provider();
  final data = <Lampiran>[].obs;
  final noRkb = RxnString(null);
  final loaded = false.obs;
  @override
  void onInit() async {
    noRkb.value = Get.arguments['noRkb'];
    if (noRkb.value != null) {
      if (kDebugMode) {
        print("noRKb ${noRkb.value}");
      }

      await provider.getLampiranRKB(noRkb.value).then((value) {
        if (value != null) {
          var lampiran = value.lampiran;
          if (lampiran != null) {
            data.addAll(lampiran);
            loaded.value = true;
          }
        } else {
          if (kDebugMode) {
            print("noRKb ${noRkb.value}");
          }
        }
      });
    } else {
      if (kDebugMode) {
        print("noRKb ${noRkb.value}");
      }
    }
    super.onInit();
  }
}
