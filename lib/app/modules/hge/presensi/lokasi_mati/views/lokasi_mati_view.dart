import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lokasi_mati_controller.dart';

class LokasiMatiView extends GetView<LokasiMatiController> {
  const LokasiMatiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text('GPS / Lokasi Mati'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 50),
              height: 100,
              child: const Icon(
                Icons.gps_off,
                size: 100,
                color: Colors.white,
              ),
            ),
            const Text(
              "GPS anda Mati, mohon Untuk menyalakan GPS anda untuk mengunakan Aplikasi ini!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            if (!controller.serviceEnable.value)
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white),
                  onPressed: () {
                    controller.aktifkanLokasi();
                  },
                  child: const Text(
                    "Nyalakan GPS / Lokasi",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
            if (controller.serviceEnable.value)
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Kembali",
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
