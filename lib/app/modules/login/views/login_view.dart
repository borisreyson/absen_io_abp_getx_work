import 'package:face_id_plus/app/controllers/navigasi_controller.dart';
import 'package:face_id_plus/app/data/utils/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../views/views/navigasi_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  var navigasiTap = Get.find<NavigasiController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            const Background(
                topPrimary: Color.fromARGB(255, 234, 27, 12),
                topSecondary: Color.fromARGB(255, 233, 190, 125),
                bottomPrimary: Color.fromARGB(255, 13, 82, 138),
                bottomSecondary: Color.fromARGB(255, 92, 233, 97),
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

  Widget loginForm(context, LoginController controller) {
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
                    "Login Abp System",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
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
                    FocusScope.of(context).requestFocus(controller.passFocus);
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
                    controller.pass.value = value!;
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
                elevation: 10,
                controller: controller.roundBtn,
                onPressed: () {
                  controller.roundBtn.start();
                  controller.doLogin();
                },
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
