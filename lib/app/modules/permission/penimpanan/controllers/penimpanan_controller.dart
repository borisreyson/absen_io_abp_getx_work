import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';
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
  late var mintaIzin;
  late var lokasi;

  @override
  void onInit() async {
    var stat = await statusIzin();
    print("status $stat");
    super.onInit();
  }

  @override
  void onClose() {}

  getPermission() async {
    var osVersion = await DeviceInfoPlugin().androidInfo;
    if (int.parse("${osVersion.version.release}") > 10) {
      print("a");

      mintaIzin = await handler.Permission.storage.status;
    } else {
      print("b");

      mintaIzin = await handler.Permission.storage.status;
    }
    if (mintaIzin == handler.PermissionStatus.denied ||
        mintaIzin == handler.PermissionStatus.limited) {
      if (int.parse("${osVersion.version.release}") > 10) {
        print("c");

        await handler.Permission.storage.request();
      } else {
        print("d");

        await handler.Permission.storage.request();
      }
      await statusIzin();
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
    } else if (mintaIzin == handler.PermissionStatus.granted) {
      await statusIzin();

      if (kDebugMode) {
        print("z");
      }
    }
  }

  Future<bool> statusIzin() async {
    var osVersion = await DeviceInfoPlugin().androidInfo;
    if (int.parse("${osVersion.version.release}") > 10) {
      lokasi = await handler.Permission.storage.status;
    } else {
      lokasi = await handler.Permission.storage.status;
    }
    var status = lokasi;
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
    Get.offAllNamed(Routes.SPLASH);
  }
}
