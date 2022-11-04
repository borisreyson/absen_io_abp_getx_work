import 'package:face_id_plus/app/data/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterAbpController extends GetxController {
  final provider = RegisterProvider();
  final nikForm = GlobalKey<FormState>();
  final usernameForm = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController().obs;
  final nikCtrl = TextEditingController().obs;
  final usernameFocus = FocusNode().obs;
  final nikFocus = FocusNode().obs;
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
  final nextBtn = RoundedLoadingButtonController();
  @override
  void onInit() {
    super.onInit();
  }


  cekNik(nik) async {
    await provider.cekNik(nik).then((value) {
      if (value != null) {
        if (value.success!) {
          found.value = true;
          nikTidakDitemukan.value = true;
          nikIcon.value = const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
          );
        } else {
          found.value = true;
          nikTidakDitemukan.value = false;

          nikIcon.value = const Icon(
            Icons.check,
            color: Colors.green,
          );
        }
      } else {
        nikTidakDitemukan.value = false;

        found.value = false;
      }
    });
  }

  cekUsername(username) async {
    await provider.cekUsername(username).then((value) {
      if (value != null) {
        if (value.success!) {
          foundUsername.value = true;
          usernameTidakDitemukan.value = true;
          usernameIcon.value = const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
          );
        } else {
          foundUsername.value = true;
          usernameTidakDitemukan.value = false;

          usernameIcon.value = const Icon(
            Icons.check,
            color: Colors.green,
          );
        }
      } else {
        usernameTidakDitemukan.value = false;

        foundUsername.value = false;
      }
    });
  }
}
