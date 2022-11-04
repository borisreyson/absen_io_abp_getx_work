import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../../routes/app_pages.dart';
import '../controllers/absen_lokal_controller.dart';

class AbsenLokalView extends GetView<AbsenLokalController> {
  const AbsenLokalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () async {
            Future.delayed(const Duration(seconds: 1), () async {});
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back(result: false);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [],
              title: Text(
                "${controller.nama.value}",
                style: const TextStyle(color: Colors.black),
              ),
              centerTitle: false,
            ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                contentBody(context),
                absenImage(context),
              ],
            ),
          ),
        ));
  }

  Widget contentBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: jam(context),
        ),
      ],
    );
  }

  Widget jam(context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${controller.rosterKerja.value}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${controller.tanggal.value}"),
            ],
          ),
        ),
        Text(
          "${controller.startClock.value}",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 0.1,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${controller.jamKerja.value}"),
        ),
        Container(
          height: 0.2,
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 11, 143, 22)),
                  onPressed: (controller.absenTerakhir.value == "Masuk")
                      ? () async {
                          await Get.toNamed(Routes.ABSEN_MASUK, arguments: {
                            "jam": controller.serverJam.value,
                            "lokasi": const LatLng(0, 0)
                          });
                          controller.getPref();
                        }
                      : null,
                  child: const Text("MASUK"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 190, 36, 25)),
                  onPressed: (controller.absenTerakhir.value == "Pulang")
                      ? () async {
                          await Get.toNamed(Routes.ABSEN_MASUK, arguments: {
                            "jam": controller.serverJam.value,
                            "lokasi": const LatLng(0, 0)
                          });
                          controller.getPref();
                        }
                      : null,
                  child: const Text("Pulang"),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget absenImage(context) {
    var fmt = DateFormat("dd MMMM yyyy");
    return Positioned(
      bottom: 10,
      left: 10,
      child: InkWell(
        onTap: () async {
          await Get.toNamed(Routes.LIST_ABSEN);
          if (kDebugMode) {
            print("Tapped");
          }
        },
        child: Column(
          children: [
            Visibility(
              visible: (controller.presensi.value.checkin != null),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: const Color.fromARGB(255, 8, 120, 11),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          color: Colors.grey.shade200,
                          width: 60,
                          height: 60,
                          child: CachedNetworkImage(
                            placeholder: (contex, url) {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Center(
                                child: Icon(
                                  Icons.broken_image_rounded,
                                  size: 95,
                                  color: Color.fromARGB(255, 235, 104, 95),
                                ),
                              );
                            },
                            imageUrl:
                                "https://abpjobsite.com/face_id/${controller.nik}/${controller.presensi.value.faceIn}",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (controller.presensi.value.checkin != null)
                                  ? "Masuk"
                                  : "Pulang",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              (controller.presensi.value.tanggal != null)
                                  ? fmt.format(DateTime.parse(
                                      "${controller.presensi.value.tanggal}"))
                                  : "",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${controller.presensi.value.checkin}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: (controller.presensi.value.checkout != null),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: const Color.fromARGB(255, 120, 8, 8),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          color: Colors.grey.shade200,
                          width: 60,
                          height: 60,
                          child: CachedNetworkImage(
                            placeholder: (contex, url) {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Center(
                                child: Icon(
                                  Icons.broken_image_rounded,
                                  size: 95,
                                  color: Color.fromARGB(255, 235, 104, 95),
                                ),
                              );
                            },
                            imageUrl:
                                "https://abpjobsite.com/face_id/${controller.nik}/${controller.presensi.value.faceOut}",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (controller.presensi.value.checkout != null)
                                  ? "Pulang"
                                  : "Masuk",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              (controller.presensi.value.tanggal != null)
                                  ? fmt.format(DateTime.parse(
                                      "${controller.presensi.value.tanggal}"))
                                  : "",
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "${controller.presensi.value.checkout}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageResolve(String gambar) {
    return CachedNetworkImage(
      placeholder: (contex, url) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
      },
      errorWidget: (context, url, error) {
        return const Center(
          child: Icon(
            Icons.broken_image_rounded,
            size: 95,
            color: Color.fromARGB(255, 235, 104, 95),
          ),
        );
      },
      imageUrl: gambar,
      fit: BoxFit.cover,
      height: 100,
      width: 100,
    );
  }
}
