import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_sarpras_controller.dart';

class MenuSarprasView extends GetView<MenuSarprasController> {
  const MenuSarprasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Sarana Prasarana'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 3,
            children: controller.listMenu,
          ),
        ),
      ),
    );
  }
}
