import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/lokasi_palsu_controller.dart';

class LokasiPalsuView extends GetView<LokasiPalsuController> {
  const LokasiPalsuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text('Lokasi Terdeteksi Palsu'),
        centerTitle: true,
      ),
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.wrong_location_outlined,
            color: Colors.white,
            size: 100,
          ),
          const Text(
            'Lokasi Anda Saat Ini Terdeteksi Palsu',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Silahkan Menonaktifkan Aplikasi Seperti Fake Fake Gps',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Ponsel Anda Sudah Ditandai Pengguna Aplikasi Fake GPS',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              if (Platform.isIOS) {
                exit(0);
              } else {
                SystemNavigator.pop();
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.white, onPrimary: Colors.blueAccent),
            child: const Text(
              "Keluar",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
