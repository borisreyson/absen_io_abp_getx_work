import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/lokasi_model.dart';
import '../controllers/lokasi_hazard_controller.dart';

class LokasiHazardView extends GetView<LokasiHazardController> {
  const LokasiHazardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: (controller.isLoading.value)
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 40,
                ),
              )
            : ListView(
                children: controller.data.map((e) => widgetCard(e)).toList(),
              ),
      ),
    );
  }

  Widget widgetCard(Lokasi e) => Card(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
        elevation: 10,
        child: InkWell(
          onTap: () {
            Get.back(result: e);
          },
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [Text("${e.lokasi}")]),
          ),
        ),
      );
}
