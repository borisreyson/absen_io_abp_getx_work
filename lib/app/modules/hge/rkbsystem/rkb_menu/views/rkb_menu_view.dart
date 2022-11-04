import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rkb_menu_controller.dart';

class RkbMenuView extends GetView<RkbMenuController> {
  const RkbMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView(
            children: controller.listMenu,
          ),
        ),
      ),
    );
  }
}
