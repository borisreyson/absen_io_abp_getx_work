import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/utils/constants.dart';

class NavigasiController extends GetxController {
  final indexSelect = 0.obs;
  var constants = Constants();
  @override
  void onClose() {}
  void tapNavigasi(index) async {
    indexSelect.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        getPref('absensi');
        break;
      case 2:
        getPref('abp');
        break;
      default:
        Get.offAllNamed('/home');
        break;
    }
  }

  getPref(state) async {
    var pref = await SharedPreferences.getInstance();
    if (state == "absensi") {
      if (kDebugMode) {
        print("a $state");
      }
      if (pref.getBool(Constants.isLogin) != null) {
        if (pref.getBool(Constants.isLogin)!) {
          Get.offAllNamed('/main-absen');
        }
      } else {
        Get.offAllNamed('/login-absen');
      }
    } else if (state == "abp") {
      if (kDebugMode) {
        print("b $state");
      }
      if (pref.getBool(Constants.isLoginAbp) != null) {
        if (pref.getBool(Constants.isLoginAbp)!) {
          Get.offAllNamed('/menu-abp');
        }
      } else {
        Get.offAllNamed('/login');
      }
    } else if (state == "qrcode") {
      Get.offAllNamed(Routes.QR_CODE);
    }
  }
}
