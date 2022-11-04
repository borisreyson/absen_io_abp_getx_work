import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../data/models/lupa_sandi_detail.dart';
import '../../../../data/providers/register_provider.dart';
import '../../../../routes/app_pages.dart';

class LupaSandiController extends GetxController {
  final provider = RegisterProvider();

  final nikKey = GlobalKey<FormState>();
  final usernameKey = GlobalKey<FormState>();
  final nikCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final nikFocus = FocusNode();
  final usernameFcocus = FocusNode();

  final nikIcon = const Icon(
    Icons.cancel_outlined,
    color: Colors.red,
  ).obs;
  final usernameIcon = const Icon(
    Icons.cancel_outlined,
    color: Colors.red,
  ).obs;
  final found = RxBool(false);
  final foundUsername = RxBool(false);
  final nikTidakDitemukan = RxBool(true);
  final usernameTidakDitemukan = RxBool(true);
  final validNik = RxBool(true);
  final validUsername = RxBool(true);
  final sendBtn = RoundedLoadingButtonController();
  final pilih = RxnInt(1);
  final nikResult = DataLogin().obs;
  @override
  void onInit() {
    super.onInit();
  }

  cekUsername(username) async {
    await provider.cekUsernameDetail(username).then((value) {
      if (value != null) {
        var res = value.dataLogin;
        if (res != null) {
          found.value = false;
          foundUsername.value = true;
          nikResult.value = res;
        } else {
          found.value = false;
          foundUsername.value = false;
        }
      }
    });
  }

  cekNik(nik) async {
    await provider.cekNikDetail(nik).then((value) {
      var res = value.dataLogin;
      if (res != null) {
        found.value = true;
        foundUsername.value = false;
        nikResult.value = res;
      } else {
        foundUsername.value = false;
        found.value = false;
      }
    });
  }

  sendOTP() async {
    Get.defaultDialog(
      title: "Mengirim Kode OTP",
      content: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
      barrierDismissible: false,
    );
    var body = CreateOtpPassword();
    body.login = "${nikResult.value.username}";
    print("login ${body.login}");
    await provider.postOtpPassword(body).then((value) async {
      var token = value.createToken;
      var success = value.success;
      if (success!) {
        await provider.sendEmail().whenComplete(() async {
          Get.back();
          await Get.toNamed(
            Routes.GANTI_SANDI,
            arguments: {"data": nikResult.value},
          );
        });
      }
    });
  }
}
