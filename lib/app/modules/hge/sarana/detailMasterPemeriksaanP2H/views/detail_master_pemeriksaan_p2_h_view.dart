import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../controllers/detail_master_pemeriksaan_p2_h_controller.dart';

class DetailMasterPemeriksaanP2HView
    extends GetView<DetailMasterPemeriksaanP2HController> {
  const DetailMasterPemeriksaanP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 132, 2),
          elevation: 0,
          title: const Text('Detail'),
          centerTitle: true,
        ),
        body: (controller.loaded.value)
            ? Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Text(
                          "${controller.data.value.diperiksa}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          rubah(),
                          if (controller.data.value.flagPemeriksaan == 0)
                            disable(),
                          if (controller.data.value.flagPemeriksaan == 1)
                            enable(),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
      ),
    );
  }

  Widget rubah() {
    return FloatingActionButton.extended(
      heroTag: "Rubah",
      elevation: 0,
      backgroundColor: Colors.orange,
      onPressed: () async {
        await Get.toNamed(Routes.RUBAH_MASTER_PEMERIKSAAN_P2_H,
            arguments: {"data": controller.data.value});
      },
      label: Row(
        children: const [
          Text("Rubah "),
          Icon(
            Icons.edit,
          ),
        ],
      ),
    );
  }

  Widget enable() {
    return FloatingActionButton.extended(
      heroTag: "Enable",
      elevation: 0,
      backgroundColor: Colors.green,
      onPressed: () async {
        controller.enableDisable(0);
      },
      label: Row(
        children: const [
          Text("Kembalikan "),
          Icon(
            CupertinoIcons.return_icon,
          ),
        ],
      ),
    );
  }

  Widget disable() {
    return FloatingActionButton.extended(
      heroTag: "Disable",
      elevation: 0,
      backgroundColor: Colors.red,
      onPressed: () async {
        controller.enableDisable(1);
      },
      label: Row(
        children: const [
          Text("Hapus "),
          Icon(
            CupertinoIcons.delete_simple,
          ),
        ],
      ),
    );
  }
}
