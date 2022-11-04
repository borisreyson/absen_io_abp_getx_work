import 'package:face_id_plus/app/data/models/sarana_models.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nomor_lambung_controller.dart';

class NomorLambungView extends GetView<NomorLambungController> {
  const NomorLambungView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: controller.searchBar,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            (controller.cari.value)
                ? IconButton(
                    onPressed: () {
                      controller.searchBar = const Text("Penanggung Jawab");
                      controller.cari.value = false;
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      controller.searchBar = appSearch(context);
                      controller.cari.value = true;
                      controller.cariFocus.requestFocus();
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                    ),
                  )
          ],
        ),
        body: ListView(
          children:
              controller.listSaranan.map((e) => widgetPenumpang(e)).toList(),
        ),
      ),
    );
  }

  Widget appSearch(BuildContext context) {
    return TextField(
      focusNode: controller.cariFocus,
      cursorColor: Colors.white,
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)),
          hintText: " Cari . . .",
          hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      onChanged: (cari) {
        controller.cariUser(cari);
      },
      controller: controller.cariController,
    );
  }

  Widget widgetPenumpang(Sarana e) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "${e.noLv} (${e.merekType}) [${e.noPol}]",
                ),
              ),
              Card(
                color: Colors.blue,
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Get.back(result: e.noLv);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "Pilih",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
