import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LokasiMatiController extends GetxController {
  final serviceEnable = false.obs;

  @override
  void onInit() {
    locatePosition();
    super.onInit();
  }

  Future<bool> locatePosition() async {
    serviceEnable.value = await Geolocator.isLocationServiceEnabled();
    return serviceEnable.value;
  }

  aktifkanLokasi() async {
    if (!serviceEnable.value) {
      var lokasi = Location();
      var check = await lokasi.serviceEnabled();
      if (check) {
        serviceEnable.value = check;
      } else {
        var enLok = await lokasi.requestService();
        if (enLok) {
          serviceEnable.value = enLok;
        } else {
          Get.snackbar(
            "Error",
            "Gagal Menyalakan GPS / Lokasi",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    }
  }
}
