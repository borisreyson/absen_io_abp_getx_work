import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/izin_lokasi_controller.dart';

class IzinLokasiView extends GetView<IzinLokasiController> {
  const IzinLokasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.green,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Aplikasi ABP ENERGY Membutuhkan Izin Lokasi Untuk Mengetahui Anda Dilokasi Yang Di Tentukan Atau Tidak!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
              ),
            ),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height / 1.3,
            child: Icon(
              CupertinoIcons.location_solid,
              color: Colors.blue,
              size: Get.width / 3,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    controller.mintaIzin();
                  },
                  child: const Text(
                    "MINTA IZIN LOKASI",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
