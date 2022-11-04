import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/models/master_pemeriksaan_model.dart';
import '../../../../../data/providers/p2h_provider.dart';

class RubahMasterPemeriksaanP2HController extends GetxController {
  final provider = P2hProvider();

  final formKey = GlobalKey<FormState>();
  final diperiksaCtrl = TextEditingController().obs;
  final diperiksaFocus = FocusNode();
  final username = RxnString(null);
  final data = MasterPemeriksaan().obs;
  final loaded = false.obs;

  void postData() async {
    if (formKey.currentState!.validate()) {
      await provider
          .update("${data.value.idPemeriksaan}", diperiksaCtrl.value.text)
          .then((value) {
        var success = value.success;
        if (success!) {
          Get.back();
          Get.back(result: true);
          Get.snackbar("Berhasil", "Berhasil Dirubah",
              colorText: Colors.white, backgroundColor: Colors.green);
        } else {
          Get.snackbar("Berhasil", "Gagal Dirubah",
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      });
    }
  }

  @override
  void onInit() async {
    var res = await Get.arguments['data'];
    if (res != null) {
      data.value = res;
      loaded.value = true;
    } else {
      loaded.value = false;
    }
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    super.onInit();
  }
}
