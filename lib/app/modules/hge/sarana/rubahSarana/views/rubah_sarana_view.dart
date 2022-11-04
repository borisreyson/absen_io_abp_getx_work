import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rubah_sarana_controller.dart';

class RubahSaranaView extends GetView<RubahSaranaController> {
  const RubahSaranaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 219, 132, 2),
          title: (controller.loaded.value)
              ? Text('Rubah Data Sarana ${controller.data.value.noLv}')
              : const Text(""),
          centerTitle: true,
        ),
        body: (controller.loaded.value)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      children: [
                        TableRow(
                          children: [
                            const Text("No Lambung"),
                            Text("${controller.data.value.noLv}"),
                            edit("no_lv", controller.data.value.saranaId,
                                controller.data.value.noLv),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Nomor Polisi"),
                            Text("${controller.data.value.noPol}"),
                            edit("no_pol", controller.data.value.saranaId,
                                controller.data.value.noPol),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Merek Tipe"),
                            Text("${controller.data.value.merekType}"),
                            edit("merek_type", controller.data.value.saranaId,
                                controller.data.value.merekType),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Jenis"),
                            Text("${controller.data.value.jenis}"),
                            edit("jenis", controller.data.value.saranaId,
                                controller.data.value.jenis),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Tahun Pembuatan"),
                            Text("${controller.data.value.thnPembuatan}"),
                            edit(
                                "thn_pembuatan",
                                controller.data.value.saranaId,
                                controller.data.value.thnPembuatan),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Isi Silinder"),
                            Text("${controller.data.value.isiSlinder}"),
                            edit("isi_slinder", controller.data.value.saranaId,
                                controller.data.value.isiSlinder),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Warna KB"),
                            Text("${controller.data.value.warnaKb}"),
                            edit("warna_kb", controller.data.value.saranaId,
                                controller.data.value.warnaKb),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("Warna TNKB"),
                            Text("${controller.data.value.warnaTnkb}"),
                            edit("warna_tnkb", controller.data.value.saranaId,
                                controller.data.value.warnaTnkb),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text("PIC"),
                            Text("${controller.data.value.nama}"),
                            edit("pic_lv", controller.data.value.saranaId,
                                controller.data.value.picLv),
                          ],
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

  Widget edit(field, no, desc) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () async {
        var res = await Get.toNamed(Routes.RUBAH_FORM_SARANA,
            arguments: {"field": field, "no": no, "desc": desc});
        if (res != null) {
          controller.getDetailSarana(no);
        }
      },
      child: const Icon(
        Icons.edit,
        color: Colors.orange,
      ),
    );
  }
}
