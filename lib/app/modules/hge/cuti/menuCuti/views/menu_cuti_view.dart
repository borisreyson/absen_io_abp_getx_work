import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_cuti_controller.dart';

class MenuCutiView extends GetView<MenuCutiController> {
  const MenuCutiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('CUTI'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            crossAxisCount: 3,
            children: controller.listCuti,
          ),
        ),
      ),
    );
  }
}
