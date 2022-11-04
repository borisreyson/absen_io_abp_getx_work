import 'package:face_id_plus/app/data/models/master_pemeriksaan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/providers/p2h_provider.dart';

class DetailMasterPemeriksaanP2HController extends GetxController {
  final data = MasterPemeriksaan().obs;
  final loaded = false.obs;
  final provider = P2hProvider();

  @override
  void onInit() async {
    var res = await Get.arguments['data'];
    if (res != null) {
      data.value = res;
      loaded.value = true;
    } else {
      loaded.value = false;
    }
    super.onInit();
  }

  void enableDisable(int flagPemeriksaan) async {
    await provider
        .enableDisable("${data.value.idPemeriksaan}", "$flagPemeriksaan")
        .then((value) {
      var success = value.success;
      if (success!) {
        Get.back(result: true);
        Get.snackbar("Berhasil", "Telah Di Update",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Gagal", "Gagal Di Update, Coba Lagi",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    });
  }
}
