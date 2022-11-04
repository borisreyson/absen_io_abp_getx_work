import 'package:face_id_plus/app/data/models/sarana_models.dart';
import 'package:face_id_plus/app/data/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../routes/app_pages.dart';

class ScanQRController extends GetxController {
  final provider = Provider();
  final rule = RxList.empty();
  final resultQr = 'Scan Code!'.obs;
  final isStarted = true.obs;

  MobileScannerController? scanner;

  @override
  void onInit() async {
    scanner = MobileScannerController();
    super.onInit();
  }

  Future<void> gotoUrl(url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  updateIzin(String? rawValue) async {
    var dt = DateTime.now();
    var jam = "${dt.hour}".padLeft(2, "0");
    var menit = "${dt.minute}".padLeft(2, "0");
    var detik = "${dt.second}".padLeft(2, "0");
    var data = UpdateSecurity();
    data.noidOut = rawValue;
    data.timeScan = "$jam:$menit:$detik";
    await provider.updateSarpras(data).then((value) async {
      if (value != null) {
        var status = value.success;
        if (status!) {
          scanner?.stop();
          isStarted.value = false;
          await Get.toNamed(Routes.SARPRAS_PDF,
              arguments: {"noSarpras": "$rawValue"});
          scanner = MobileScannerController();
          isStarted.value = true;
          scanner?.start();
        } else {
          Get.snackbar("Error", "Error QR Code Not Valid! ",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } else {
        Get.snackbar("Error", "Error QR Code Not Valid! ",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    });
  }
}
