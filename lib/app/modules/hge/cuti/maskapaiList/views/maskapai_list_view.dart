import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/maskapai_list_controller.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/maskapai_model.dart';

class MaskapaiListView extends GetView<MaskapaiListController> {
  const MaskapaiListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.loaded.value)
        ? Scaffold(
            floatingActionButton:
                (!controller.option.value) ? floatingAction() : null,
            appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 71, 9),
              title: const Text('Maskapai Penerbangan'),
              centerTitle: true,
            ),
            body: ListView(
                children: controller.data.map((e) => maskapaiCard(e)).toList()))
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
          ));
  }

  Widget maskapaiCard(Data e) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.flight_takeoff_rounded),
                const SizedBox(
                  width: 10,
                ),
                Text("${e.namaMaskapai}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!controller.option.value)
                  Card(
                    color: Colors.orange,
                    child: InkWell(
                      onTap: () async {
                        var res = await Get.toNamed(Routes.FORM_MASKAPAI,
                            arguments: {"maskapai": e});
                        if (res != null) {
                          if (res) {
                            var hal = 1;
                            controller.data.clear();
                            controller.getMaskapai(hal);
                          }
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                if (controller.option.value)
                  Card(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Get.back(result: e);
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Pilih",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget floatingAction() {
    return FloatingActionButton.extended(
      onPressed: () async {
        var res = await Get.toNamed(Routes.FORM_MASKAPAI);
        if (res != null) {
          if (res) {
            Get.snackbar("Berhasil", "Maskapai Berhasil Di Tambah!",
                colorText: Colors.white, backgroundColor: Colors.green);
            if (res != null) {
              if (res) {
                var hal = 1;
                controller.data.clear();
                controller.getMaskapai(hal);
              }
            }
          } else {
            Get.snackbar("Gagal", "Maskapai Gagal Di Tambah!",
                colorText: Colors.white, backgroundColor: Colors.red);
            if (res != null) {
              if (res) {
                var hal = 1;
                controller.data.clear();
                controller.getMaskapai(hal);
              }
            }
          }
        }
      },
      label: const Text("Tambah Maskapai"),
      icon: const Icon(Icons.post_add_rounded),
    );
  }
}
