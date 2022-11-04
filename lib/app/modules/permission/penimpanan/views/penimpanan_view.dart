import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penimpanan_controller.dart';

class PenimpananView extends GetView<PenimpananController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFF2D0A7),
            Color(0xFF5D768C),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Penggunaan Penyimpanan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF732002)),
                    ),
                  ),
                  const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.sd_storage_rounded,
                          size: 100, color: Color(0xFFBF6734))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Kami Membutuhkan Penyimpanan Anda untuk melakukan penyimpanan file pengguna, sebagai penyimpanan sementara, jadi Izin untuk penggunaan penyimpanan sangat di perlukan",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Color(0xFF732002)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (!controller.izinStatus.value)
                      ? ElevatedButton.icon(
                          label: const Text("Meminta Izin Penyimpanan"),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 189, 11, 165)),
                          onPressed: () {
                            controller.getPermission();
                          },
                          icon: const Icon(Icons.sd_storage_rounded))
                      : ElevatedButton.icon(
                          label: const Text("Selanjutnya"),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 189, 11, 165)),
                          onPressed: () {
                            // Get.offAllNamed(Routes.HOME);
                            controller.saveIntro(context);
                          },
                          icon: const Icon(Icons.chevron_right)),
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
                        controller.saveIntro(context);
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
