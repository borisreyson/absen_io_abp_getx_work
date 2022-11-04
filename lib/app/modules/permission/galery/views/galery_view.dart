import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/galery_controller.dart';

class GaleryView extends GetView<GaleryController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 177, 167, 242),
            Color.fromARGB(255, 60, 12, 133),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Penggunaan Galeri",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.perm_media_outlined,
                          size: 100,
                          color: Color.fromARGB(255, 250, 250, 250))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Kami Membutuhkan Galeri Anda untuk melakukan pengambulan file pengguna, sebagai data yand dibutuhkan oleh aplikasi, jadi Izin untuk penggunaan Galeri sangat di perlukan",
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(color: Color.fromARGB(255, 254, 255, 251)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (!controller.galeryStatus.value)
                      ? ElevatedButton.icon(
                          label: const Text("Meminta Izin Penyimpanan"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 11, 189, 97),
                          ),
                          onPressed: () {
                            controller.getPermission();
                          },
                          icon: const Icon(Icons.perm_media_outlined),
                        )
                      : ElevatedButton.icon(
                          label: const Text("Selanjutnya"),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 85, 189, 11),
                          ),
                          onPressed: () {
                            controller.saveIntro();
                          },
                          icon: const Icon(Icons.chevron_right),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      label: const Text(
                        "Lewati",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        controller.saveIntro();
                      },
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
