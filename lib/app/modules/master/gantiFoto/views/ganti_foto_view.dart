import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/ganti_foto_controller.dart';

class GantiFotoView extends GetView<GantiFotoController> {
  const GantiFotoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Ganti Foto Profile'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            foto(),
            btnChange(),
          ],
        ),
      ),
    );
  }

  Widget foto() {
    return Container(
      child: (controller.file.value != null)
          ? Card(
              margin: const EdgeInsets.all(10),
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.IMAGE_HAZARD_VIEW, arguments: {
                    "image": controller.foto.value,
                    "loaded": true
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: Get.height / 2,
                  child: Image.file(
                    File(
                      controller.file.value!,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : (controller.foto.value != null)
              ? InkWell(
                  onTap: () {
                    Get.toNamed(Routes.IMAGE_HAZARD_VIEW, arguments: {
                      "image": controller.foto.value,
                      "loaded": true
                    });
                  },
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: Get.height / 2,
                      child: Card(
                        elevation: 10,
                        child: CachedNetworkImage(
                          imageUrl: "${controller.foto.value}",
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: CupertinoActivityIndicator(radius: 40),
                          ),
                          errorWidget: (context, url, err) => const Center(
                            child: CupertinoActivityIndicator(radius: 40),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : (controller.fineNull.value)
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        height: 105,
                        width: 105,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200)),
                          elevation: 10,
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.person_alt,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const CupertinoActivityIndicator(
                      radius: 20,
                      color: Colors.red,
                    ),
    );
  }

  Widget btnChange() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.orange),
          onPressed: () {
            controller.buktiPicker();
          },
          icon: const Icon(Icons.cloud_upload_outlined),
          label: const Text("Unggah Gambar")),
    );
  }
}
