import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/models/sarana_models.dart';
import '../../../../../data/providers/provider.dart';

class SarprasAdminController extends GetxController {
  final provider = Provider();
  final formKey = GlobalKey<FormState>();
  final keteranganCtrl = TextEditingController();
  final keteranganFocus = FocusNode();
  final username = RxnString(null);
  final dataId = RxnString(null);
  @override
  void onInit() {
    getPref();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    dataId.value = await Get.arguments['dataId'];
  }

  void cancelSarana() async {
    var body = ApproveSarana();
    body.username = username.value;
    body.keterangan = keteranganCtrl.text.toString();
    body.dataId = dataId.value;
    await provider.cancelSarana(body).then((value) {
      if (value != null) {
        if (value.success!) {
          Get.back(result: true);
          Get.snackbar("Berhasil", "Surat Izin Telah Di Batalkan");
        } else {
          Get.snackbar("Gagal", "Surat Izin Gagal Di Batalkan");
        }
      } else {
        Get.snackbar("Gagal", "Surat Izin Gagal Di Batalkan");
      }
    });
  }
}
