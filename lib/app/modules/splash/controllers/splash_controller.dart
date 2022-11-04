import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/utils/constants.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);
  late final animation =
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn).obs;
  final cameraStatus = false.obs;
  final penyimpananStatus = false.obs;
  final lokasiStatus = false.obs;
  final galeryStatus = false.obs;
  @override
  void onInit() {
    Future.delayed(
        const Duration(
          milliseconds: 2400,
        ), () async {
      await checkIntro();
    });

    super.onInit();
  }

  Future<bool> izinCamera() async {
    var camera = handler.Permission.camera;
    var status = await camera.status;
    if (status == handler.PermissionStatus.granted) {
      cameraStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      cameraStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      cameraStatus.value = false;
    }
    return cameraStatus.value;
  }

  Future<bool> izinPenyimpanan() async {
    var camera = handler.Permission.storage;
    var status = await camera.status;
    if (status == handler.PermissionStatus.granted) {
      penyimpananStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      penyimpananStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      penyimpananStatus.value = false;
    }
    return penyimpananStatus.value;
  }

  Future<bool> izinLokasi() async {
    var camera = handler.Permission.locationWhenInUse;
    var status = await camera.status;
    if (status == handler.PermissionStatus.granted) {
      lokasiStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      lokasiStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      lokasiStatus.value = false;
    }
    return lokasiStatus.value;
  }

  Future<bool> izinGalery() async {
    var camera = handler.Permission.mediaLibrary;
    var status = await camera.status;
    if (status == handler.PermissionStatus.granted) {
      galeryStatus.value = true;
    }
    if (status == handler.PermissionStatus.denied) {
      galeryStatus.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      galeryStatus.value = false;
    }
    return galeryStatus.value;
  }

  checkIntro() async {
    var pref = await SharedPreferences.getInstance();
    var intro = pref.getBool(Constants.intro);
    if (intro != null) {
      if (intro) {
        Get.offAllNamed('/home');
      } else {
        await izinCamera();
        await izinPenyimpanan();
        await izinGalery();
        await izinLokasi();

        if (cameraStatus.value &&
            penyimpananStatus.value &&
            lokasiStatus.value &&
            galeryStatus.value) {
          Get.offAllNamed('/home');
        } else {
          Get.offAllNamed('/lokasi');
        }
      }
    } else {
      await izinCamera();
      await izinPenyimpanan();
      await izinGalery();
      await izinLokasi();

      if (cameraStatus.value &&
          penyimpananStatus.value &&
          lokasiStatus.value &&
          galeryStatus.value) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/lokasi');
      }
    }
    print(
        "intro $intro , ${cameraStatus.value} , ${penyimpananStatus.value} , ${lokasiStatus.value} , ${galeryStatus.value}");
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
