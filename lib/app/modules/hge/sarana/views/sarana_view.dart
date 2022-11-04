import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sarana_controller.dart';

class SaranaView extends GetView<SaranaController> {
  const SaranaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 219, 132, 2),
        actions: [
          IconButton(
              onPressed: () {
                controller.onRefresh();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: DynamicHeightGridView(
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          crossAxisCount: 3,
          itemCount: controller.widgetList.length,
          builder: (BuildContext context, int index) {
            return controller.widgetList[index];
          },
        ),
      ),
    );
  }
}
