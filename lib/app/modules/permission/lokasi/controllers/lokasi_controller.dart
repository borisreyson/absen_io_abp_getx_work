import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:location/location.dart' as loc;

class LokasiController extends GetxController {
  final statusLokasi = false.obs;
  final aktifLokasi = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    cekLokasi();
    izinLokasi();
    super.onInit();
  }


  @override
  void onClose() {}

  cekLokasi() async {
    aktifLokasi.value = await Geolocator.isLocationServiceEnabled();
  }

  getPermission() async {
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

  enableGPS() async {
    loc.Location location = loc.Location();
    if (!await location.serviceEnabled()) {
      aktifLokasi.value = await location.requestService();
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
  }
}
