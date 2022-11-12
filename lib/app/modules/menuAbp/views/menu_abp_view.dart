import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:face_id_plus/app/controllers/navigasi_controller.dart';
import 'package:face_id_plus/app/modules/menuAbp/views/loading_abp_view.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:face_id_plus/app/views/views/navigasi_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_abp_controller.dart';

// ignore: use_key_in_widget_constructors
class MenuAbpView extends GetView<MenuAbpController> {
  MenuAbpView({Key? key}) : super(key: key);
  final navigasiTap = Get.find<NavigasiController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: (!controller.isLoading.value)
            ? AppBar(
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "ABP Energy",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
                backgroundColor: const Color(0xFF732937),
                actions: [
                  IconButton(
                      onPressed: () async {
                        var res = await Get.toNamed(Routes.PROFILE_ABP);
                        if (res) {
                          controller.isLoading.value = true;
                          await controller.getPref();
                        }
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                      ))
                ],
              )
            : null,
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigasiView(navigasiTap: navigasiTap),
        body: (controller.isLoading.value)
            ? const LoadingAbpView()
            : Padding(
                padding: const EdgeInsets.all(10),
                child: DynamicHeightGridView(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  crossAxisCount: controller.countColumn.value,
                  itemCount: controller.widgetList.length,
                  builder: (BuildContext context, int index) {
                    return controller.widgetList[index];
                  },
                ),
              ),
      ),
    );
  }
}
