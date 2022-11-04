import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/models/master_pemeriksaan_model.dart';
import '../controllers/master_pemeriksaan_p2_h_controller.dart';

class MasterPemeriksaanP2HView extends GetView<MasterPemeriksaanP2HController> {
  const MasterPemeriksaanP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: floatingAction(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 132, 2),
          title: const Text(
            'Master Pemeriksaan Sarana',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
        ),
        backgroundColor: const Color.fromARGB(255, 226, 223, 223),
        body: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          enablePullDown: true,
          enablePullUp: controller.pullUp.value,
          child: ListView(
            children: controller.data.map((e) => cardPemeriksaan(e)).toList(),
          ),
        ),
      ),
    );
  }

  Widget cardPemeriksaan(MasterPemeriksaan e) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Card(
        color: (e.flagPemeriksaan == 1) ? Colors.red : Colors.white,
        elevation: 10,
        child: InkWell(
          onTap: () async {
            var res = await Get.toNamed(Routes.DETAIL_MASTER_PEMERIKSAAN_P2_H,
                arguments: {"data": e});
            if (res != null) {
              if (res!) {
                controller.onRefresh();
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "${e.diperiksa}",
              style: TextStyle(
                  color:
                      (e.flagPemeriksaan == 1) ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget floatingAction() {
    return FloatingActionButton.extended(
      heroTag: "Tambah Pemeriksaaan",
      backgroundColor: Colors.black,
      onPressed: () async {
        var res = await Get.toNamed(Routes.TAMBAH_MASTER_PEMERIKSAAN_P2_H);
        if (res != null) {
          if (res) {
            controller.onRefresh();
          }
        }
      },
      label: Row(
        children: const [Text("Tambah "), Icon(Icons.add_task_rounded)],
      ),
    );
  }
}
