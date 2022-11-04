import 'package:face_id_plus/app/data/providers/register_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/devisi_controller.dart';

class DevisiView extends GetView<DevisiController> {
  const DevisiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back(result: null);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Devisi',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: (controller.loaded.value)
            ? ListView(
                children: controller.listDevisi
                    .map((element) => widgetDept(element))
                    .toList(),
              )
            : const Center(
                child: CupertinoActivityIndicator(radius: 40),
              ),
      ),
    );
  }

  Widget widgetDept(ListDevisi e) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1.0, color: Colors.lightBlue.shade900))),
      child: InkWell(
        onTap: () {
          Get.back(result: e);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "${e.sect}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
