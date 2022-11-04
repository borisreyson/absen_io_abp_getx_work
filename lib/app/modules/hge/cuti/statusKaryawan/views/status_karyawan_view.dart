import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_karyawan_controller.dart';

class StatusKaryawanView extends GetView<StatusKaryawanController> {
  const StatusKaryawanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Status Karyawan'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 224, 221, 221),
        body: ListView(
          children:
              controller.listStatusKaryawan.map((e) => cardStatus(e)).toList(),
        ),
      ),
    );
  }

  Widget cardStatus(String e) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {
          Get.back(result: e);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(e),
        ),
      ),
    );
  }
}
