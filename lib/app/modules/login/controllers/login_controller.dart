import 'package:face_id_plus/app/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/face_model.dart';
import '../../../data/providers/provider.dart';
import '../../../data/utils/constants.dart';

class LoginController extends GetxController {
  final _provider = Provider();
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FocusNode userFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  Rx<String?> user = null.obs;
  Rx<String?> pass = null.obs;
  Rx<bool> passwordVisible = false.obs;
  FaceModel? faceModel;
  RoundedLoadingButtonController roundBtn = RoundedLoadingButtonController();

  @override
  void onClose() {}
  toggleVisible() {
    passwordVisible.value = !passwordVisible.value;
  }

  doLogin() async {
    if (formKey.currentState!.validate()) {
      var loginABP = LoginABP();
      loginABP.username = userController.text;
      loginABP.password = passController.text;
      await _provider.login(loginABP).then((value) {
        AuthModel authModel = AuthModel.fromJson(value.body);
        if (authModel.login != null) {
          if (authModel.login!.success!) {
            var user = authModel.login!.user;
            _setPref(user!);
          } else {
            Get.snackbar(
                "Error Login", "Username Dan Password Salah, Coba Lagi");
            roundBtn.error();
            Future.delayed(const Duration(milliseconds: 1500), () {
              roundBtn.reset();
            });
          }
        } else {
          Get.snackbar("Error Login", "Username Dan Password Salah, Coba Lagi");
          roundBtn.error();
          Future.delayed(const Duration(milliseconds: 1500), () {
            roundBtn.reset();
          });
        }
      });
    } else {
      Get.snackbar("Error Login", "Username Dan Password Tidak Boleh Kosong");
      roundBtn.error();
      Future.delayed(const Duration(milliseconds: 1500), () {
        roundBtn.reset();
      });
    }
  }

  _setPref(User user) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setBool(Constants.isLoginAbp, true);
    await pref.setString(Constants.username, "${user.username}");
    await pref.setString(Constants.nik, "${user.nik}");
    await pref.setString(Constants.name, "${user.namaLengkap}");
    await pref.setString(Constants.rule, "${user.rule}");
    await pref.setString(Constants.fotoProfile, "${user.photoProfile}");
    await pref.setString(Constants.company, "${user.perusahaan}");
    await pref.setString(Constants.section, "${user.section}");
    await pref.setString(Constants.departement, "${user.department}");
    Get.offAllNamed('/menu-abp');
  }
}
