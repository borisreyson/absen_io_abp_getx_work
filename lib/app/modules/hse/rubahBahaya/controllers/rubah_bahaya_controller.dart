import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/data_hazard.dart';
import '../../../../data/repository/repository_api.dart';
import '../../../../data/utils/constants.dart';

class RubahBahayaController extends GetxController {
  final tipe = ''.obs;
  final formKey = GlobalKey<FormState>().obs;
  final repository = HazardRepository();

  final Color warna = const Color.fromARGB(255, 8, 19, 147);
  final deskripsi = TextEditingController();
  final deskripsiSebelumnya = TextEditingController();
  final data = Data().obs;
  @override
  void onInit() {
    data.value = Get.arguments['data'] as Data;
    tipe.value = Get.arguments['tipe'];
    deskripsiSebelumnya.text = (tipe.value == "bahaya")
        ? "${data.value.deskripsi}"
        : (tipe.value == "perbaikan")
            ? "${data.value.keteranganUpdate}"
            : "${data.value.tindakan}";
    super.onInit();
  }


  @override
  void onClose() {}

  void submit() async {
    if (formKey.value.currentState!.validate()) {
      Constants().showAlert(
        dismiss: false,
        loading: true,
        enBtn: false,
      );

      var uid = data.value.uid;
      var type = tipe.value;
      if (kDebugMode) {
        print("res $type");
      }

      var desk = deskripsi.text;
      await repository.postUpdateDeskripsi(uid, type, desk).then((res) {
        if (res != null) {
          if (res.success) {
            Get.back(result: true);
            Get.back(result: true);
          } else {
            Get.back();
          }
        } else {
          Get.back();
        }
      }).catchError((onError) {
        if (kDebugMode) {
          print("Error $onError");
        }
        Get.back();
      });
    }
  }
}
