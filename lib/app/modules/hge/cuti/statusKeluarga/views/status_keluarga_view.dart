import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_keluarga_controller.dart';

class StatusKeluargaView extends GetView<StatusKeluargaController> {
  const StatusKeluargaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 71, 9),
        title: const Text('Status Keluarga'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "TK");
                },
                child: const Text(
                  "Tidak Kawin",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K0");
                },
                child: const Text(
                  "Kawin, Belum Punya Anak",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K1");
                },
                child: const Text(
                  "Kawin, Anak 1",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K2");
                },
                child: const Text(
                  "Kawin Anak 2",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K3");
                },
                child: const Text(
                  "Kawin Anak 3",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K4");
                },
                child: const Text(
                  "Kawin Anak 4",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K5");
                },
                child: const Text(
                  "Kawin Anak 5",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K6");
                },
                child: const Text(
                  "Kawin Anak 6",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K7");
                },
                child: const Text(
                  "Kawin Anak 7",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K8");
                },
                child: const Text(
                  "Kawin Anak 8",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K9");
                },
                child: const Text(
                  "Kawin Anak 9",
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.back(result: "K10");
                },
                child: const Text(
                  "Kawin Anak 10",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
