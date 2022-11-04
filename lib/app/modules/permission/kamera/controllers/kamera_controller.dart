import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

class KameraController extends GetxController {
  final statusKamera = false.obs;

  @override
  void onInit() {
    statusIzin();
    super.onInit();
  }


  @override
  void onClose() {}

  statusIzin() async {
    var lokasi = handler.Permission.camera;
    var status = await lokasi.status;
    if (status == handler.PermissionStatus.granted) {
      statusKamera.value = true;
      if (kDebugMode) {
        print("statusKamera $statusKamera");
      }
    }
    if (status == handler.PermissionStatus.denied) {
      statusKamera.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      statusKamera.value = false;
    }
  }

  getPermission() async {
    var mintaIzin = await handler.Permission.camera.status;
    if (mintaIzin == handler.PermissionStatus.denied ||
        mintaIzin == handler.PermissionStatus.limited) {
      await handler.Permission.camera.request();
      statusIzin();
    } else if (mintaIzin == handler.PermissionStatus.permanentlyDenied) {
      await handler.openAppSettings();
    } else {
      statusIzin();
    }
    if (kDebugMode) {
      print("statusKamera $statusKamera");
    }
  }
}
