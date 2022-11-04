import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/izin_kamera_controller.dart';

class IzinKameraView extends GetView<IzinKameraController> {
  const IzinKameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Aplikasi ABP ENERGY Membutuhkan Izin Kamera Untuk Mengambil Gambar Anda Sebagai Presensi Kehadiran!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height / 1.3,
            child: Icon(
              CupertinoIcons.photo_camera,
              color: Colors.white,
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
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    controller.getPermission();
                  },
                  child: const Text(
                    "MINTA IZIN KAMERA",
                    style: TextStyle(color: Colors.black),
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
