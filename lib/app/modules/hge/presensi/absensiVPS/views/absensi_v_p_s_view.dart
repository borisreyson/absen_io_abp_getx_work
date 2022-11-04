import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/absensi_v_p_s_controller.dart';

class AbsensiVPSView extends GetView<AbsensiVPSController> {
  const AbsensiVPSView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
          actions: [
            IconButton(
                onPressed: () async {
                  bool res = await Get.toNamed('/profile');
                  if (res) {
                    Get.offAllNamed('/login-absen');
                  }
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
          title: Text(
            controller.nama.value,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: false,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            contentBody(context),
            // absenImage(),
          ],
        ),
      ),
    );
  }

  Widget contentBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        jam(),
        gogleMap(context),
      ],
    );
  }

  Widget jam() {
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
                controller.rosterKerja.value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(controller.tanggal.value),
            ],
          ),
        ),
        Text(
          controller.startClock.value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 0.1,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(controller.jamKerja.value),
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
                  onPressed: () {},
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
                  onPressed: () {},
                  child: const Text("Pulang"),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  gogleMap(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      child: GoogleMap(
        initialCameraPosition: controller.kGooglePlex.value,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController c) async {
          controller.googleMapController = c;
          controller.mapController.complete(c);
          controller.streamLokasi();
        },
        markers: controller.markers,
        polygons: Set<Polygon>.of(controller.polygons),
        myLocationEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
      ),
    );
  }

  // Widget absenImage() {
  //   return Positioned(
  //     bottom: 10,
  //     left: 10,
  //     child: Column(
  //       children: [
  //         Visibility(
  //           visible: (controller.masuk.value.status != null),
  //           child: Padding(
  //             padding: const EdgeInsets.all(4.0),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadiusDirectional.circular(20),
  //                 color: const Color.fromARGB(255, 8, 120, 11),
  //               ),
  //               padding: const EdgeInsets.all(6),
  //               child: Row(
  //                 children: [
  //                   ClipOval(
  //                     child: Container(
  //                       color: Colors.grey.shade200,
  //                       width: 60,
  //                       height: 60,
  //                       child: Image.network(
  //                         "https://abpjobsite.com/face_id/${controller.nik}/${controller.masuk.value.gambar}",
  //                         fit: BoxFit.fitWidth,
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           "${controller.masuk.value.status}",
  //                           style: const TextStyle(color: Colors.white),
  //                         ),
  //                         Text(
  //                           "${controller.masuk.value.jam}",
  //                           style: const TextStyle(color: Colors.white),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         Visibility(
  //           visible: (controller.pulang.value.status != null),
  //           child: Padding(
  //             padding: const EdgeInsets.all(4.0),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadiusDirectional.circular(20),
  //                 color: const Color.fromARGB(255, 177, 29, 18),
  //               ),
  //               padding: const EdgeInsets.all(6),
  //               child: Row(
  //                 children: [
  //                   ClipOval(
  //                     child: Container(
  //                       color: Colors.grey.shade200,
  //                       width: 50,
  //                       height: 50,
  //                       child: Image.network(
  //                         "https://abpjobsite.com/face_id/${controller.nik}/${controller.pulang.value.gambar}",
  //                         fit: BoxFit.fitWidth,
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           "${controller.pulang.value.status}",
  //                           style: const TextStyle(color: Colors.white),
  //                         ),
  //                         Text(
  //                           "${controller.pulang.value.jam}",
  //                           style: const TextStyle(color: Colors.white),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
