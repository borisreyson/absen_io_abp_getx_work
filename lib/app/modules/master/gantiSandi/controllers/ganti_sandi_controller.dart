import 'dart:async';

import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/lupa_sandi_detail.dart';
import '../../../../data/providers/register_provider.dart';

class GantiSandiController extends GetxController {
  final provider = RegisterProvider();
  final data = DataLogin().obs;
  final loaded = false.obs;
  final kodeVerifikasiCtrl = TextEditingController();
  final kodeVerifikasiFocus = FocusNode();
  late Timer _timer;
  final start = 90.obs;
  final kodeOtp = RxnString(null);
  @override
  void onInit() async {
    var res = await Get.arguments['data'];
    if (res != null) {
      data.value = res;
      startTimer();
      loaded.value = true;
    } else {
      loaded.value = false;
    }
    super.onInit();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  verifikasiOtp(String kodeOtp) async {
    Get.defaultDialog(
      title: "Sedang Di Verifikasi",
      content: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
      barrierDismissible: false,
    );
    var body = ValidOtpPassword();
    body.username = data.value.username;
    body.tokenPassword = kodeOtp;

    await provider.verifikasiOtpPassword(body).then((value) {
      var success = value.success;
      if (success) {
        Get.back();
        Get.snackbar("Berhasil", "Kode OTP Valid");
        Get.toNamed(Routes.GANTI_SANDI_FORM, arguments: {"data": data.value});
      } else {
        Get.back();
        Get.snackbar("Gagal", "Kode OTP Tidak Valid");
      }
    });
  }
}
