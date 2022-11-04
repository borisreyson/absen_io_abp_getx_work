import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/kemungkinan_model.dart';
import '../controllers/kemungkinan_controller.dart';

class KemungkinanView extends GetView<KemungkinanController> {
  const KemungkinanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Kemungkinan Resiko"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: (controller.isLoading.value)
            ? const Center(
                child: CupertinoActivityIndicator(radius: 40),
              )
            : ListView(
                children: controller.data.map((e) => widgetCard(e)).toList(),
              ),
      ),
    );
  }

  Widget widgetCard(Kemungkinan e) {
    double lebar = Get.width / 5;

    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.back(result: e);
        },
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "${e.kemungkinan}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Nilai Resiko : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: lebar),
                    child: Text(
                      "${e.nilai}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Keterangan",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 1,
                minLeadingWidth: 1,
                leading: const Text("-"),
                title: Text(
                  e.keterangan!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
