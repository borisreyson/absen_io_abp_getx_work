import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/penumpang_controller.dart';
import 'package:face_id_plus/app/data/models/data_karayawan.dart';

class PenumpangView extends GetView<PenumpangController> {
  PenumpangView({Key? key}) : super(key: key);
  var i = 1;

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
                      controller.searchBar = const Text("Penumpang");
                      controller.cari.value = false;
                      controller.cariController.clear();
                      controller.cariUser(null);
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
          children: controller.data.map((e) => widgetCard(e)).toList(),
        ),
        floatingActionButton: (controller.dipilih.isNotEmpty)
            ? FloatingActionButton(
                onPressed: () {
                  List<Data> dipilih = controller.dipilih;
                  Get.back(result: dipilih);
                },
                backgroundColor: Colors.orange,
                child: const Icon(CupertinoIcons.check_mark),
              )
            : null,
      ),
    );
  }

  Widget widgetCard(Data e) {
    if (controller.dipilih.contains(e)) {
      print(i++);
    }
    return Card(
      color: (controller.dipilih.contains(e)) ? Colors.green : Colors.white,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      elevation: 10,
      child: InkWell(
        onTap: () {
          if (controller.dipilih.contains(e)) {
            controller.dipilih.removeWhere((item) => item == e);
          } else {
            controller.dipilih.add(e);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${e.nama}",
                      textAlign: TextAlign.right,
                    ),
                    Text("${e.nik}"),
                    Text("${e.dept}"),
                    Text("${e.namaPerusahaan}"),
                  ],
                ),
              ),
            )
          ],
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
