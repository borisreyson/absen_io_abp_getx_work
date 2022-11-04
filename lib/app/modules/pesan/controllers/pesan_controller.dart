import 'package:face_id_plus/app/data/models/rkb_detail_models.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/pesan_models.dart';
import '../../../data/providers/provider.dart';

class PesanController extends GetxController {
  final provider = Provider();
  final formKey = GlobalKey<FormState>();

  final noRkbCtrl = TextEditingController();
  final partNameCtrl = TextEditingController();
  final subjectCtrl = TextEditingController();
  final pesanCtrl = TextEditingController();

  final noRkbFocus = FocusNode();
  final partNameFocus = FocusNode();
  final subjectFocus = FocusNode();
  final pesanFocus = FocusNode();
  final username = RxnString(null);
  final data = RkbDetail().obs;

  @override
  void onInit() async {
    var _data = await Get.arguments['data'];
    if (_data != null) {
      data.value = _data;
      noRkbCtrl.text = "${data.value.noRkb}";
      partNameCtrl.text = "${data.value.partName}";
    }
    getPref();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void kirim() async {
    var body = PesanModels();
    body.noRkb = data.value.noRkb;
    body.partName = data.value.partName;
    body.usernameTo = data.value.userEntry;
    body.username = username.value;
    body.tree = 'parent';
    body.subject = subjectCtrl.text.toString();
    body.message = pesanCtrl.text.toString();
    Constants().showAlert(enBtn: false, loading: true);

    if (formKey.currentState!.validate()) {
      await provider.tanyakanRKB(body).then((value) {
        print("pesan ${value.approve}");

        if (value != null) {
          if (value.approve!) {
            Get.back(result: true);
            Get.back(result: true);

            Get.snackbar("Berhasil", "Berhasil Mengirim Pesan",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.back(result: true);

            Get.snackbar("Error", "Gagal Mengirim Pesan",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        } else {
          Get.back(result: true);
          Get.snackbar("Error", "Gagal Mengirim Pesan",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
    } else {
      Get.back(result: true);
      Get.snackbar("Error", "Gagal Mengirim Pesan",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
  }
}
