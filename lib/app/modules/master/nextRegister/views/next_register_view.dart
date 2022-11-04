import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../controllers/next_register_controller.dart';

class NextRegisterView extends GetView<NextRegisterController> {
  const NextRegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Akun'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Form(key: controller.formKey, child: showForm()),
          ],
        ),
      ),
    );
  }

  Widget showForm() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        inputBox(
          controller.usernameCtrl.value,
          controller.usernameFocus.value,
          1,
          "Username",
          padding: 10,
          readonly: true,
          enable: false,
        ),
        inputBox(
          controller.nikCtrl.value,
          controller.nikFocus.value,
          1,
          "Nik",
          padding: 10,
          readonly: true,
          enable: false,
        ),
        inputBox(
          controller.namaCtrl.value,
          controller.namaFocus.value,
          1,
          "Nama Lengkap",
          padding: 10,
        ),
        inputBox(
          controller.emailCtrl.value,
          controller.emailFocus.value,
          1,
          "Email",
          padding: 10,
          sufixIcon:
              (controller.validMail.value) ? controller.mailIcon.value : null,
          onComplete: (email) {
            if (kDebugMode) {
              print("email $email");
            }
            if (email == null) {
              controller.validMail.value = false;
            } else {
              bool validMail = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email);
              if (kDebugMode) {
                print("validMail $validMail");
              }

              if (validMail) {
                controller.validMail.value = true;
                controller.mailIcon.value = const Icon(
                  Icons.check,
                  color: Colors.green,
                );
              } else {
                controller.validMail.value = true;
                controller.mailIcon.value = const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                );
              }
            }
          },
        ),
        inputBox(
          controller.deptCtrl.value,
          controller.deptFocus.value,
          1,
          "Departemen",
          padding: 10,
          onTap: () => controller.departemen(),
          readonly: true,
        ),
        inputBox(
          controller.devisiCtrl.value,
          controller.devisiFocus.value,
          1,
          "Devisi",
          padding: 10,
          onTap: () => controller.devisi(),
          readonly: true,
        ),
        inputBox(
          controller.jabatanCtrl.value,
          controller.jabatanFocus.value,
          1,
          "Jabatan",
          padding: 10,
        ),
        inputBox(controller.perusahaanCtrl.value,
            controller.perusahaanFocus.value, 1, "Perusahaan",
            padding: 10, onTap: () => controller.perusahaan(), readonly: true),
        inputBox(
          controller.sandiCtrl.value,
          controller.sandiFocus.value,
          1,
          "Kata Sandi",
          padding: 10,
          sufixIcon:
              (controller.validSandi.value) ? controller.sandiIcon.value : null,
          onComplete: (sandi) {
            if (sandi != null) {
              if (sandi.length >= 5) {
                controller.validSandi.value = true;
                controller.sandiIcon.value = const Icon(
                  Icons.check,
                  color: Colors.green,
                );
              } else {
                controller.validSandi.value = true;
                controller.sandiIcon.value = const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                );
              }
            } else {
              controller.validSandi.value = false;
            }
          },
          obscureText: true,
        ),
        inputBox(
          controller.ulangiSandiCtrl.value,
          controller.ulangiSandiFocus.value,
          1,
          "Ulangi Kata Sandi",
          padding: 10,
          sufixIcon: (controller.sameSandi.value)
              ? controller.ulangiSandiIcon.value
              : null,
          onComplete: (v) async {
            if (v == controller.sandiCtrl.value.text) {
              controller.sameSandi.value = true;
              controller.ulangiSandiIcon.value = const Icon(
                Icons.check,
                color: Colors.green,
              );
              controller.sandiSama.value = false;
            } else {
              controller.sameSandi.value = true;
              controller.ulangiSandiIcon.value = const Icon(
                Icons.cancel_outlined,
                color: Colors.red,
              );
              controller.sandiSama.value = true;
            }
          },
          obscureText: true,
        ),
        if (controller.sandiSama.value)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Row(
                children: const [
                  Icon(
                    Icons.cancel,
                    size: 15,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Sandi Tidak Sama!",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: const [
                Icon(
                  Icons.label,
                  size: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Sandi Harus Lebih Dari 5 Huruf!",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RoundedLoadingButton(
          color: Colors.amber,
          elevation: 10,
          controller: controller.regButton,
          onPressed: () {
            controller.regButton.start();
            controller.registerAkun();
          },
          child: const Text(
            "Daftar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget inputBox(
      TextEditingController ctrl, FocusNode focused, int line, String label,
      {bool validate = true,
      bool enable = true,
      double? padding,
      double? elevation,
      bool? readonly = false,
      Function()? onTap,
      Function(String?)? onComplete,
      int? minLines,
      Color? cardColor,
      Icon? prefixIcon,
      // ignore: unnecessary_question_mark
      dynamic? sufixIcon,
      // ignore: unnecessary_question_mark
      dynamic? keyboardType,
      bool? obscureText = false}) {
    return Card(
      color: cardColor,
      elevation: (elevation != null) ? elevation : 0,
      child: Padding(
        padding: EdgeInsets.all((padding != null) ? padding : 0),
        child: TextFormField(
          keyboardType: keyboardType,
          onTap: onTap,
          readOnly: readonly!,
          enabled: enable,
          maxLines: line,
          minLines: minLines,
          focusNode: focused,
          obscureText: obscureText!,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: sufixIcon,
              border: const OutlineInputBorder(),
              labelText: label),
          onSaved: (value) {
            ctrl.text = value!;
          },
          onFieldSubmitted: (term) {
            focused.unfocus();
          },
          onChanged: onComplete,
          validator: (validate)
              ? (value) {
                  if (value!.isEmpty) {
                    return '$label Wajib Di Isi';
                  }
                  return null;
                }
              : null,
          controller: ctrl,
        ),
      ),
    );
  }
}
