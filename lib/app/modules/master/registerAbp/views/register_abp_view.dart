// ignore_for_file: unnecessary_question_mark

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../data/utils/background.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/register_abp_controller.dart';

class RegisterAbpView extends GetView<RegisterAbpController> {
  const RegisterAbpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Akun ABP'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            const Background(
                topPrimary: Color.fromARGB(255, 176, 118, 0),
                topSecondary: Color.fromARGB(255, 123, 255, 0),
                bottomPrimary: Color.fromARGB(255, 130, 13, 138),
                bottomSecondary: Color.fromARGB(255, 255, 0, 153),
                bgColor: Color.fromARGB(255, 15, 2, 78)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  listForm(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Sudah Punya Akun ? "),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                "MASUK",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 112, 9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView listForm() {
    return ListView(
      children: [
        Form(
          key: controller.nikForm,
          child: inputBox(
            controller.nikCtrl.value,
            controller.nikFocus.value,
            1,
            "Nik",
            padding: 10,
            prefixIcon:
                (controller.found.value) ? controller.nikIcon.value : null,
            sufixIcon: InkWell(
              onTap: () async {
                if (controller.nikForm.currentState!.validate()) {
                  await controller.cekNik(controller.nikCtrl.value.text);
                }
              },
              child: const Icon(Icons.search),
            ),
            keyboardType: TextInputType.number,
            validate: controller.validNik.value,
          ),
        ),
        if (!controller.nikTidakDitemukan.value)
          Form(
            key: controller.usernameForm,
            child: inputBox(
              controller.usernameCtrl.value,
              controller.usernameFocus.value,
              1,
              "Username",
              padding: 10,
              prefixIcon: (controller.foundUsername.value)
                  ? controller.usernameIcon.value
                  : null,
              sufixIcon: InkWell(
                onTap: () async {
                  if (controller.usernameForm.currentState!.validate()) {
                    await controller
                        .cekUsername(controller.usernameCtrl.value.text);
                  }
                },
                child: const Icon(Icons.search),
              ),
              validate: controller.validUsername.value,
            ),
          ),
        if (!controller.usernameTidakDitemukan.value &&
            !controller.nikTidakDitemukan.value)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RoundedLoadingButton(
                color: Colors.amber,
                elevation: 10,
                controller: controller.nextBtn,
                onPressed: () async {
                  await Get.toNamed(
                    Routes.NEXT_REGISTER,
                    arguments: {
                      "nik": controller.nikCtrl.value.text,
                      "username": controller.usernameCtrl.value.text
                    },
                  );
                },
                animateOnTap: false,
                child: const Text(
                  "Lanjut",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )),
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
      int? minLines,
      Color? cardColor,
      Icon? prefixIcon,
      dynamic? sufixIcon,
      dynamic? keyboardType}) {
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
