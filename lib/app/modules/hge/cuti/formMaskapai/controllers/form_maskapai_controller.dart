import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/maskapai_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormMaskapaiController extends GetxController {
  final provider = ProviderCuti();
  final formKey = GlobalKey<FormState>();
  final namaMaskapaiCtrl = TextEditingController();

  final namaMaskapaiFocus = FocusNode();
  final username = RxnString(null);
  final option = false.obs;
  final data = Data().obs;
  @override
  void onInit() async {
    var ar = await Get.arguments;
    if (ar != null) {
      var res = await ar["maskapai"];
      option.value = true;
      if (res != null) {
        data.value = res;
      }
      print("res $res");
    } else {
      option.value = false;
    }
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);

    super.onInit();
  }

  Future<void> simpanMaskapai() async {
    if (formKey.currentState!.validate()) {
      var body = MaskapaiPost();
      body.namaMaskapai = namaMaskapaiCtrl.text;
      body.userInMaskapai = username.value;
      await provider.maskapaiAdd(body).then((value) {
        var res = value.success;
        if (res!) {
          Get.back(result: true);
        } else {
          Get.back(result: false);
        }
      });
    }
  }

  void updateMaskapai() async {
    if (formKey.currentState!.validate()) {
      var body = MaskapaiPost();
      body.idMaskapai = "${data.value.idMaskapai}";
      body.namaMaskapai = namaMaskapaiCtrl.text;
      body.userInMaskapai = username.value;
      await provider.maskapaiUpdate(body).then((value) {
        var res = value.success;
        if (res!) {
          Get.back(result: true);
        } else {
          Get.back(result: false);
        }
      });
    }
  }
}
