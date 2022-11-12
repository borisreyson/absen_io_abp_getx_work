import 'package:face_id_plus/app/controllers/navigasi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../../data/utils/background.dart';
import '../../../../../views/views/navigasi_view.dart';
import '../controllers/login_absen_controller.dart';

// ignore: must_be_immutable
class LoginAbsenView extends GetView<LoginAbsenController> {
  var navigasiTap = Get.find<NavigasiController>();

  LoginAbsenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            const Background(
                topPrimary: Color.fromARGB(255, 138, 234, 12),
                topSecondary: Color.fromARGB(255, 249, 0, 0),
                bottomPrimary: Color.fromARGB(255, 191, 21, 163),
                bottomSecondary: Color.fromARGB(255, 95, 16, 16),
                bgColor: Colors.white),
            loginForm(context, controller),
          ],
        ),
        bottomNavigationBar: NavigasiView(
          navigasiTap: navigasiTap,
        ),
      ),
    );
  }

  Widget loginForm(ctx, loginCtrl) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const Center(
              child: Card(
                margin: EdgeInsets.only(top: 50, bottom: 50),
                elevation: 20,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Login Absensi",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: controller.denganAbp.value,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        focusNode: controller.userFocus,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Username / NIK"),
                        onSaved: (value) {
                          controller.user.value = value!;
                        },
                        onFieldSubmitted: (term) {
                          controller.userFocus.unfocus();
                          FocusScope.of(ctx).requestFocus(controller.passFocus);
                        },
                        validator: (value) {
                          final isValidateUsername = RegExp(r'^[a-zA-Z0-9]*$');
                          if (value!.isEmpty) {
                            return 'Username Wajib Di Isi';
                          } else if (!isValidateUsername.hasMatch(value)) {
                            return 'Only letters are allowed';
                          }
                          return null;
                        },
                        controller: controller.userController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        focusNode: controller.passFocus,
                        obscureText: !controller.passwordVisible.value,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: "Password",
                            hintText: "Password",
                            suffixIcon: IconButton(
                                icon: !controller.passwordVisible.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () {
                                  controller.passFocus.unfocus();
                                  controller.toggleVisible();
                                })),
                        onSaved: (value) {
                          controller.pass.value = value;
                        },
                        onFieldSubmitted: (term) {
                          controller.passFocus.unfocus();
                          controller.doLogin();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password Wajib Di Isi';
                          }
                          return null;
                        },
                        controller: controller.passController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedLoadingButton(
                    animateOnTap: controller.animateBtn.value,
                    elevation: 10,
                    controller: controller.roundBtn,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.animateBtn.value = true;
                        controller.roundBtn.start();
                        controller.akunDitemukan.value = false;
                        controller.doLogin();
                      } else {
                        controller.animateBtn.value = false;
                        controller.akunDitemukan.value = true;
                      }
                    },
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: controller.akunDitemukan.value,
              child: RoundedLoadingButton(
                animateOnTap: controller.akunDitemukan.value,
                color: const Color.fromARGB(255, 121, 21, 14),
                controller: controller.roundBtn,
                onPressed: () {
                  controller.doLoginABP();
                },
                child: const Text(
                  "Masuk Dengan Akun ABP",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
