import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lokasi_controller.dart';

class LokasiView extends GetView<LokasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF2D4B73),
          Color(0xFF253C59),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Obx(() {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Lokasi PT Alamjaya Bara Pratama",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  Image.asset(
                    "assets/images/abp_maps.png",
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Kami Membutuhkan Lokasi Anda untuk mengetahui anda berada di area PT Alamajaya Bara Pratama Atau tidak, jadi kami membutukan izin lokasi anda pada saat aplikasi ini di gunakan.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (controller.statusLokasi.value)
                      ? ElevatedButton.icon(
                          label: const Text("Selanjutnya"),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 3, 131, 35)),
                          onPressed: () {
                            Get.offAllNamed('/kamera');
                          },
                          icon: const Icon(Icons.chevron_right),
                        )
                      : ElevatedButton.icon(
                          label: const Text("Meminta Izin Lokasi"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFBF8D30),
                          ),
                          onPressed: () {
                            controller.getPermission();
                          },
                          icon: const Icon(Icons.approval),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: (!controller.aktifLokasi.value),
                    child: ElevatedButton.icon(
                      label: const Text(
                        "Aktifkan Lokasi",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        controller.enableGPS();
                      },
                      icon: const Icon(
                        Icons.location_disabled,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      label: const Text(
                        "Lewati",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        Get.offAllNamed('/kamera');
                      },
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )),
                ]);
          }),
        ),
      ),
    );
  }
}
