import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/perusahaan_model.dart';
import '../controllers/perusahaan_controller.dart';

class PerusahaanView extends GetView<PerusahaanController> {
  const PerusahaanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Perusahaan"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: (controller.isLoading.value)
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              )
            : ListView(
                children:
                    controller.data.map((e) => perusahaanCard(e)).toList(),
              ),
      ),
    );
  }

  Widget perusahaanCard(Company e) => Card(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
        elevation: 10,
        child: InkWell(
          onTap: () {
            Get.back(result: e);
          },
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [Text("${e.namaPerusahaan}")]),
          ),
        ),
      );
}
