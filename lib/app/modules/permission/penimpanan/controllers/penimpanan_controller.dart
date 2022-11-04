import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import '../../../../data/utils/constants.dart';
import '../../../../routes/app_pages.dart';

class PenimpananController extends GetxController {
  final izinStatus = false.obs;
  int? isLogin;
  final intro = false.obs;
  final visbleIntro = false;
  final enableGPS = false;
  @override
  void onInit() async {
    var stat = await statusIzin();
    print("status $stat");
    super.onInit();
  }


  @override
  void onClose() {}

  getPermission() async {
    var mintaIzin = await handler.Permission.storage.status;
    if (mintaIzin == handler.PermissionStatus.denied ||
        mintaIzin == handler.PermissionStatus.limited) {
      await handler.Permission.storage.request();
      statusIzin();
      if (kDebugMode) {
        if (kDebugMode) {
          print("a $mintaIzin");
        }
      }
    } else if (mintaIzin == handler.PermissionStatus.permanentlyDenied) {
      if (kDebugMode) {
        print("b");
      }
      await handler.openAppSettings();
    }
    if (kDebugMode) {
      print("z");
    }
  }

  Future<bool> statusIzin() async {
    var lokasi = handler.Permission.storage;
    var status = await lokasi.status;
    if (status == handler.PermissionStatus.granted) {
      izinStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      izinStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      izinStatus.value = false;
    }
    return izinStatus.value;
  }

  saveIntro(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setBool(Constants.intro, true);
    Get.offAllNamed(Routes.HOME);
  }
}
