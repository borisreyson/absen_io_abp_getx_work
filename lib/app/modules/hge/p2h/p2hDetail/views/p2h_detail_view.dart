import 'package:face_id_plus/app/data/models/p2h_temuan_models.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/utils/utils.dart';
import '../controllers/p2h_detail_controller.dart';

class P2hDetailView extends GetView<P2hDetailController> {
  const P2hDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: const Text(
            'P2H LV 01',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            cardHeader(),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 1,
              width: Get.width,
              color: Colors.grey,
            ),
            cardKondisi(),
            Center(child: lihatSemuaChecklist()),
          ],
        ),
      ),
    );
  }

  Widget cardHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        children: [
          TableRow(
            children: [
              const Text(
                "NO POL / LAMBUNG",
                textAlign: TextAlign.left,
              ),
              Text(
                "${controller.detailP2h.value.p2hNoPol} / ${controller.detailP2h.value.p2hNoLambung} ",
                textAlign: TextAlign.right,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "TANGGAL",
                textAlign: TextAlign.left,
              ),
              Text(
                (controller.detailP2h.value.p2hTglAwal != null)
                    ? controller.fmt.format(DateTime.parse(
                        "${controller.detailP2h.value.p2hTglAwal}"))
                    : "-",
                textAlign: TextAlign.right,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "SHIFT",
                textAlign: TextAlign.left,
              ),
              Text(
                "${controller.detailP2h.value.p2hShift} ",
                textAlign: TextAlign.right,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "HM / KM AWAL",
                textAlign: TextAlign.left,
              ),
              Text(
                (controller.detailP2h.value.p2hHmKmAwal != null)
                    ? CurrencyFormat().convertToIdr(
                            int.parse(
                                "${controller.detailP2h.value.p2hHmKmAwal}"),
                            0) +
                        " KM"
                    : "-",
                textAlign: TextAlign.right,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "HM / KM AKHIR",
                textAlign: TextAlign.left,
              ),
              Text(
                (controller.detailP2h.value.p2hHmKmAkhir != null)
                    ? CurrencyFormat().convertToIdr(
                        int.parse("${controller.detailP2h.value.p2hHmKmAkhir}"),
                        0)
                    : "-",
                textAlign: TextAlign.right,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "DI P2H OLEH",
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "${controller.detailP2h.value.namaLengkap ?? "-"} ",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "Departemen",
                textAlign: TextAlign.left,
              ),
              Text(
                "${controller.detailP2h.value.dept ?? "-"} ",
                textAlign: TextAlign.right,
              ),
            ],
          ),
          TableRow(
            children: [
              const Text(
                "Temuan",
                textAlign: TextAlign.left,
              ),
              Text(
                "${controller.detailP2h.value.totalTemuan ?? ""}",
                textAlign: TextAlign.right,
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardKondisi() {
    return (controller.listTemuan.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            color: const Color.fromARGB(255, 214, 211, 211),
            child: Column(
              children: controller.listTemuan.map((e) => cardItem(e)).toList(),
            ))
        : const Center();
  }

  Widget cardItem(P2hTemuan e) {
    return SizedBox(
      width: Get.width,
      child: Card(
        margin: const EdgeInsets.all(5),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${e.diperiksa}"),
                  Text((e.p2hKetersediaan ?? "").toUpperCase()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("- Kondisi"),
                  ),
                  Text((e.p2hKondisi == "ada")
                      ? "Ada"
                      : (e.p2hKondisi == "tidak_baik")
                          ? "Tidak Baik"
                          : "-"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("- Keterangan"),
                  ),
                  Flexible(child: Text("${e.p2hKeterangan}")),
                ],
              ),
              Center(
                child: ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(Routes.VIEW_IMAGE, arguments: {
                        "urlImage": "${controller.basUrl}${e.p2hFotoTemuan}"
                      });
                    },
                    icon: const Icon(Icons.attach_file),
                    label: const Text("Lihat Foto Temuan")),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget lihatSemuaChecklist() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(Routes.LIST_PEMERIKSAAN_P2_H,
            arguments: {"uniqid": controller.detailP2h.value.p2hUniqid});
      },
      child: const Text("Lihat Semua List Pemeriksaan"),
    );
  }
}
