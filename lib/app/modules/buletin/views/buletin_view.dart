import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buletin_controller.dart';

class BuletinView extends GetView<BuletinController> {
  const BuletinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
            ),
            title: Text(
              "${controller.tgl.value}",
              style: const TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${controller.data.value.judul}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
                width: Get.width,
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${controller.data.value.pesan}"),
              ),
            ],
          )),
    );
  }
}
