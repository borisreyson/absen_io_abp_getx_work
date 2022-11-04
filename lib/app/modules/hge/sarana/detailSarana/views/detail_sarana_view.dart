import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_sarana_controller.dart';

class DetailSaranaView extends GetView<DetailSaranaController> {
  const DetailSaranaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 219, 132, 2),
          title: (controller.loaded.value)
              ? Text('${controller.data.value.noLv}')
              : const Text(""),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: (controller.loaded.value)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        Text("Nomor Polisi"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.noPol}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Nomor Lambung"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.noLv}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Merek Tipe"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.merekType}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Jenis"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.jenis}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Tahun Pembuatan"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.thnPembuatan}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Isi Silinder"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.isiSlinder}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Warna KB"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.warnaKb}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Warna TNKB"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.warnaTnkb}"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("PIC"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${controller.data.value.nama}"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              ),
      ),
    );
  }
}
