import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_p2_h_controller.dart';

class MenuP2HView extends GetView<MenuP2HController> {
  const MenuP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: const Text(
            'P2H Sarana',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: (controller.rule.value != null)
            ? DynamicHeightGridView(
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                builder: (BuildContext context, int index) {
                  return controller.listMenu[index];
                },
                crossAxisCount: 3,
                itemCount: controller.listMenu.length,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
