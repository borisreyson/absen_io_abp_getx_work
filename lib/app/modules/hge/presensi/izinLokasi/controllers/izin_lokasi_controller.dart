import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

class IzinLokasiController extends GetxController {
  final statusLokasi = false.obs;
  void mintaIzin() async {
    var mintaIzin = await handler.Permission.locationWhenInUse.status;
    if (mintaIzin == handler.PermissionStatus.denied ||
        mintaIzin == handler.PermissionStatus.limited) {
      await handler.Permission.locationWhenInUse.request();
      izinLokasi();
    } else if (mintaIzin == handler.PermissionStatus.permanentlyDenied) {
      await handler.openAppSettings();
    } else {
      izinLokasi();
    }
  }

  izinLokasi() async {
    var lokasi = handler.Permission.locationWhenInUse;
    var status = await lokasi.status;
    if (status == handler.PermissionStatus.granted) {
      statusLokasi.value = true;
    } else if (status == handler.PermissionStatus.denied) {
      statusLokasi.value = false;
    } else if (status == handler.PermissionStatus.permanentlyDenied) {
      statusLokasi.value = false;
    }
    if (statusLokasi.value) {
      Get.back(result: false);
    }
  }
}
