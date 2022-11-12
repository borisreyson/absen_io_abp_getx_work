import 'package:face_id_plus/app/data/models/cek_login_model.dart';
import 'package:face_id_plus/app/data/models/login_model.dart' as modelLogin;
import 'package:face_id_plus/app/data/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/models/face_model.dart';
import '../../../../../data/utils/constants.dart';

class LoginAbsenController extends GetxController {
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
  final animateBtn = false.obs;
  final akunDitemukan = false.obs;
  final denganAbp = true.obs;
  final userData = User().obs;
  @override
  void onInit() {
    checkAkunAbp();
    super.onInit();
  }

  doLogin() async {
    if (formKey.currentState!.validate()) {
      var loginAbp = modelLogin.LoginABP();
      loginAbp.username = userController.text;
      loginAbp.password = passController.text;
      apiLogin(loginAbp);
    } else {
      roundBtn.error();
      Future.delayed(const Duration(milliseconds: 600), () {
        Get.snackbar(
            "Error Login", "Username/Nik Atau Password Tidak Boleh Kosong!!");
        userFocus.requestFocus();
        roundBtn.reset();
      });
    }
  }

  doLoginABP() async {
    denganAbp.value = false;
    roundBtn.start();
    var loginAbp = modelLogin.LoginABP();
    loginAbp.username = userData.value.nik;
    loginAbp.password = '12345';
    apiLogin(loginAbp);
  }

  apiLogin(loginAbp) async {
    await _provider.loginApiFace(loginAbp).then((result) async {
      faceModel = result;
      if (faceModel != null) {
        if (faceModel!.datalogin == null) {
          userFocus.requestFocus();
          Future.delayed(const Duration(milliseconds: 1000), () {
            Get.snackbar("Error Login", "Username/ Nik Atau Password Salah!!");
            roundBtn.error();
            userController.clear();
            passController.clear();
            denganAbp.value = true;
            Future.delayed(const Duration(milliseconds: 1000), () {
              roundBtn.reset();
            });
          });
        } else {
          Datalogin datalogin = faceModel!.datalogin!;
          await setPref(
              true,
              datalogin.nik,
              datalogin.nama,
              datalogin.departemen,
              datalogin.devisi,
              datalogin.jabatan,
              datalogin.flag.toString(),
              datalogin.showAbsen,
              datalogin.perusahaan.toString());
          roundBtn.success();
          Get.offAllNamed('/main-absen');
        }
      } else {
        userFocus.requestFocus();
        Future.delayed(const Duration(milliseconds: 1000), () {
          Get.snackbar("Error Login", "Username/ Nik Atau Password Salah!!");
          roundBtn.error();
          userController.clear();
          passController.clear();
          Future.delayed(const Duration(milliseconds: 1000), () {
            roundBtn.reset();
          });
        });
      }
    });
  }

  setPref(
      bool login,
      String? nik,
      String? nama,
      String? departemen,
      String? jabatan,
      String? devisi,
      String? flag,
      int? showAbsen,
      String? perusahaan) async {
    var sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool(Constants.isLogin, login);
    await sharedPref.setString(Constants.nikAbsen, "$nik");
    await sharedPref.setString(Constants.namaAbsen, "$nama");
    await sharedPref.setString(Constants.departemenAbsen, "$departemen");
    await sharedPref.setString(Constants.devisiAbsen, "$devisi");
    await sharedPref.setString(Constants.jabatanAbsen, "$jabatan");
    await sharedPref.setString(Constants.flagAbsen, "$flag");
    await sharedPref.setInt(
        Constants.showAbsen, (showAbsen != null) ? showAbsen : 0);
    await sharedPref.setString(Constants.perusahaanAbsen, "$perusahaan");
  }

  toggleVisible() {
    passwordVisible.value = !passwordVisible.value;
  }

  checkAkunAbp() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getBool(Constants.isLoginAbp) != null) {
      if (pref.getBool(Constants.isLoginAbp)!) {
        var nik = pref.getString(Constants.nik);
        await _provider.getCekLogin(nik).then((value) {
          if (value.body != null) {
            var cekLogin = CekLogin.fromJson(value.body);
            if (cekLogin.user != null) {
              userData.value = cekLogin.user!;
              akunDitemukan.value = true;
            } else {
              akunDitemukan.value = false;
            }
          }
        });
      }
    }
  }
}
