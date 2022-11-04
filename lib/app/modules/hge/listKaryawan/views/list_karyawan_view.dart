import 'package:face_id_plus/app/data/models/data_karayawan.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/list_karyawan_controller.dart';

class ListKaryawanView extends GetView<ListKaryawanController> {
  const ListKaryawanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: controller.searchBar,
          centerTitle: true,
          actions: [
            (controller.cari.value)
                ? IconButton(
                    onPressed: () {
                      controller.searchBar = const Text("Karyawan");
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
        body: SmartRefresher(
          onLoading: controller.onLoading,
          enablePullDown: true,
          enablePullUp: controller.enPullUp.value,
          onRefresh: controller.onRefresh,
          controller: controller.refreshController,
          child: ListView(
              children: controller.karyawan
                  .map((element) => cardKaryawan(element))
                  .toList()),
        ),
      ),
    );
  }

  Widget cardKaryawan(Data data) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.back(result: data);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text("${data.nama}"),
              Text("${data.nik}"),
              Text((data.sect != null) ? "${data.sect}" : "-"),
              Text((data.jabatan != null) ? "${data.jabatan}" : "-"),
              Text((data.dept != null) ? "${data.dept}" : "-"),
            ],
          ),
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
      onChanged: (name) {
        controller.cariUser(name);
      },
      controller: controller.cariController,
    );
  }
}
