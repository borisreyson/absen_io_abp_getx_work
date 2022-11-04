import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rubah_bahaya_controller.dart';

class RubahBahayaView extends GetView<RubahBahayaController> {
  const RubahBahayaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          title: Text((controller.tipe.value == "bahaya")
              ? "Rubah Bahaya"
              : (controller.tipe.value == "perbaikan")
                  ? "Rubah Tindakan"
                  : "Rubah Keterangan Perbaikan"),
        ),
        body: Stack(
          children: [
            Form(
              key: controller.formKey.value,
              child: ListView(
                children: [
                  deskBahayaSebelumnya(),
                  deskBahaya(),
                ],
              ),
            ),
            btnAksi(),
          ],
        ),
      ),
    );
  }

  Widget deskBahayaSebelumnya() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Material(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    enabled: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
                      labelStyle: TextStyle(color: controller.warna),
                      alignLabelWithHint: true,
                      labelText: (controller.tipe.value == "bahaya")
                          ? "Deskripsi Bahaya Sebelumnya"
                          : (controller.tipe.value == "perbaikan")
                              ? "Keterangan Perbaikan Sebelumnya"
                              : "Tindakan Sebelumnya",
                      hintText: (controller.tipe.value == "bahaya")
                          ? "Deskripsi Bahaya Sebelumnya"
                          : (controller.tipe.value == "perbaikan")
                              ? "Keterangan Perbaikan Sebelumnya"
                              : "Tindakan Sebelumnya",
                    ),
                    controller: controller.deskripsiSebelumnya,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return (controller.tipe.value == "bahaya")
                            ? "Deskripsi Bahaya Sebelumnya"
                            : (controller.tipe.value == "perbaikan")
                                ? "Keterangan Perbaikan Sebelumnya"
                                : "Tindakan Sebelumnya";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget deskBahaya() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Material(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    maxLines: 10,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: controller.warna)),
                      labelStyle: TextStyle(color: controller.warna),
                      alignLabelWithHint: true,
                      labelText: (controller.tipe.value == "bahaya")
                          ? "Deskripsi Bahaya"
                          : (controller.tipe.value == "perbaikan")
                              ? "Keterangan Perbaikan"
                              : "Tindakan",
                    ),
                    controller: controller.deskripsi,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return (controller.tipe.value == "bahaya")
                            ? "Deskripsi Bahaya Sebelumnya Wajib Di Isi"
                            : (controller.tipe.value == "perbaikan")
                                ? "Keterangan Perbaikan Sebelumnya Wajib Di Isi"
                                : "Tindakan Sebelumnya Wajib Di Isi";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget btnAksi() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: Colors.blue.shade700,
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    controller.submit();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.red.shade700,
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    Get.back(result: false);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Batal",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
