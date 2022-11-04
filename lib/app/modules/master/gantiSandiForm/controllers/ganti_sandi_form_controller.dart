import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/login_model.dart';
import '../../../../data/models/lupa_sandi_detail.dart';
import '../../../../data/providers/register_provider.dart';

class GantiSandiFormController extends GetxController {
  final provider = RegisterProvider();
  final sandiBaruCtrl = TextEditingController();
  final ulangiSandiBaruCtrl = TextEditingController();
  final sandiBaruFocus = FocusNode();
  final ulangiSandiBaruFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  final username = RxnString(null);
  final data = DataLogin().obs;

  @override
  void onInit() async {
    var res = await Get.arguments['data'];
    if (res != null) {
      data.value = res;
      username.value = data.value.username;
    }
    super.onInit();
  }

  void simpanSandi() async {
    Get.defaultDialog(
      title: "Sedang Menyimpan Sandi Baru",
      content: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
      barrierDismissible: false,
    );
    var loginABP = LoginABP();
    loginABP.username = username.value;
    loginABP.password = sandiBaruCtrl.text;
    if (formKey.currentState!.validate()) {
      if (sandiBaruCtrl.text != ulangiSandiBaruCtrl.text) {
        Get.snackbar("Error", "Sandi Tidak Sama, Coba Lagi!",
            colorText: Colors.white, backgroundColor: Colors.red);
        Get.back();
      } else {
        await provider.postSandiBaru(loginABP).then((value) {
          var success = value.success;
          if (success) {
            Get.back();
            Get.back();
            Get.back();
            Get.back();
            Get.snackbar("Success", "Sandi Telah Diganti!",
                colorText: Colors.white, backgroundColor: Colors.green);
          } else {
            Get.back();
            Get.snackbar("Gagal", "Gagal Mengganti Sandi, Coba Lagi!",
                colorText: Colors.white, backgroundColor: Colors.red);
          }
        });
      }
    }
  }
}
