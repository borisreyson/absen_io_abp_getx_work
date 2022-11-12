import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signature_view_controller.dart';

class SignatureViewView extends GetView<SignatureViewController> {
  const SignatureViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: floatingAction(),
        appBar: AppBar(
          title: const Text('Tanda Tangan'),
          centerTitle: true,
        ),
        body: Center(
          child: (controller.loaded.value)
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    imageUrl: "${controller.url}${controller.imageData.value}",
                  ),
                )
              : const CircularProgressIndicator(
                  color: Colors.black,
                ),
        ),
      ),
    );
  }

  FloatingActionButton floatingAction() {
    return FloatingActionButton.extended(
      onPressed: () async {
        var res = await Get.toNamed(Routes.SIGNATURE_CREATE);
        if (res != null) {
          controller.getPref();
        }
      },
      label: const Text("Rubah Tanda Tangan"),
      icon: const Icon(CupertinoIcons.signature),
    );
  }
}
