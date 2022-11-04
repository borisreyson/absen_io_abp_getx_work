import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_image_controller.dart';

class ViewImageView extends GetView<ViewImageController> {
  const ViewImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: Get.width,
          child: CachedNetworkImage(
            imageUrl: "${controller.url.value}",
            placeholder: (a, context) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.blue),
              );
            },
            errorWidget: (a, context, msg) {
              return const Center(
                child: Icon(Icons.person),
              );
            },
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
