import 'package:face_id_plus/app/controllers/navigasi_controller.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/utils/background.dart';
import '../../../../../views/views/navigasi_view.dart';
import '../controllers/main_absen_controller.dart';

class MainAbsenView extends GetView<MainAbsenController> {
  final navigasiTap = Get.find<NavigasiController>();
  MainAbsenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigasiView(navigasiTap: navigasiTap),
      body: Obx(
        () => Stack(
          children: [
            const Background(
                topPrimary: Color.fromARGB(255, 237, 91, 80),
                topSecondary: Color.fromARGB(255, 114, 16, 9),
                bottomPrimary: Colors.blue,
                bottomSecondary: Color.fromARGB(255, 8, 66, 113),
                bgColor: Colors.white),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  serverIsOffline(),
                  loadingPing(),
                  (controller.serverOnline.value)
                      ? (controller.isOnline.value)
                          ? lanjutAbp(context)
                          : (controller.lokalOnline.value)
                              ? lanjutOffline(context)
                              : Container()
                      : (controller.isOnline.value)
                          ? lanjutAbp(context)
                          : (controller.lokalOnline.value)
                              ? lanjutOffline(context)
                              : Container(),
                  menuAbsen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingPing() {
    return Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            Visibility(
              visible: (!controller.serverOnline.value)
                  ? (!controller.isOnline.value)
                      ? (!controller.lokalOnline.value)
                          ? true
                          : false
                      : false
                  : false,
              child: const CupertinoActivityIndicator(
                color: Colors.red,
                radius: 20,
              ),
            ),
            Card(
              color: (controller.serverOnline.value)
                  ? Colors.green
                  : (controller.serverVps.value)
                      ? Colors.green
                      : (controller.isOnline.value)
                          ? Colors.green
                          : (controller.lokalOnline.value)
                              ? Colors.green
                              : Colors.red,
              margin: const EdgeInsets.only(top: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  (controller.serverOnline.value)
                      ? "Mengecek Server Online"
                      : (controller.isOnline.value)
                          ? "Mengecek Server Online"
                          : (controller.serverVps.value)
                              ? "Mengecek Server Online"
                              : (controller.lokalOnline.value)
                                  ? "Mengecek Server Online"
                                  : "Mengecek Server Offline",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }

  Widget lanjutVps(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        child: const Text("Lanjut"),
        onPressed: () async {
          controller.closeStream();

          await Get.toNamed('/absensi-v-p-s');
          controller.serverStream();
        },
      ),
    );
  }

  Widget lanjutAbp(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: const Text("Lanjut"),
        onPressed: () async {
          controller.isRunning.value = false;
          controller.closeStream();
          await Get.toNamed('/absensi');
          controller.serverStream();
        },
      ),
    );
  }

  Widget lanjutOffline(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 132, 17, 8)),
        child: const Text("Lanjut"),
        onPressed: () async {
          controller.isRunning.value = false;
          controller.closeStream();
          await Get.toNamed(Routes.ABSEN_LOKAL);
          controller.serverStream();
        },
      ),
    );
  }

  Widget serverIsOffline() {
    var style = const TextStyle(color: Colors.red);
    return Card(
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Jika Server Offline",
                style: style,
              ),
              Text(
                "Coba Untuk Menggunakan Jaringan Wifi PT ABP",
                style: style,
              )
            ],
          ),
        ));
  }

  Widget menuAbsen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          elevation: 10,
          child: InkWell(
            onTap: () async {
              controller.closeStream();
              await Get.toNamed('/list-absen');
              controller.serverStream();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [
                  Icon(Icons.data_thresholding_outlined),
                  Text("List Absen"),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 10,
          child: InkWell(
            onTap: () async {
              controller.closeStream();
              await Get.toNamed('/roster-kerja');
              controller.serverStream();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [
                  Icon(Icons.calendar_month),
                  Text("Roster Kerja"),
                ],
              ),
            ),
          ),
        ),
        // Card(
        //   elevation: 10,
        //   child: InkWell(
        //     onTap: () {
        //       Get.toNamed('/grafik-kehadiran');
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Column(
        //         children: const [
        //           Icon(Icons.area_chart_rounded),
        //           Text("Kehadiran"),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
