import 'package:face_id_plus/app/data/models/p2h_sarana_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/utils/utils.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/list_p2h_sarpras_controller.dart';

class ListP2hSarprasView extends GetView<ListP2hSarprasController> {
  const ListP2hSarprasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromARGB(255, 210, 208, 208),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          title: const Text(
            'P2H Sarana',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: (controller.loaded.value)
            ? (controller.dataP2h.isNotEmpty)
                ? ListView(
                    children:
                        controller.dataP2h.map((e) => cardP2H(e)).toList())
                : const Center(child: Text("Data Belum Ada"))
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
      ),
    );
  }

  Widget cardP2H(Data e) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 40, right: 10, bottom: 10),
              child: Column(
                children: [
                  Table(
                    key: key,
                    children: [
                      TableRow(
                        children: [
                          const Text(
                            "NO POL / LAMBUNG",
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "${e.p2hNoPol ?? ""} / ${e.p2hNoLambung ?? ""}",
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text(
                            "TANGGAL & JAM",
                            textAlign: TextAlign.left,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (e.p2hTglAwal != null)
                                    ? controller.fmt.format(
                                        DateTime.parse("${e.p2hTglAwal}"))
                                    : "",
                                textAlign: TextAlign.right,
                              ),
                              Text("${e.p2hJamAwal}")
                            ],
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
                            e.p2hShift ?? "",
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
                            (e.p2hHmKmAwal != null)
                                ? CurrencyFormat().convertToIdr(
                                        int.parse("${e.p2hHmKmAwal}"), 0) +
                                    " KM"
                                : "-",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 13, 94, 15)),
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
                            (e.p2hHmKmAkhir != null)
                                ? CurrencyFormat().convertToIdr(
                                        int.parse("${e.p2hHmKmAkhir}"), 0) +
                                    " KM"
                                : "-",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 143, 24, 16)),
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
                              e.namaLengkap ?? "",
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
                            e.dept ?? "",
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
                            "${e.totalTemuan}",
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
                  if (e.p2hHmKmAkhir == null)
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        onPressed: () async {
                          var res = await Get.toNamed(Routes.UPDATE_HM_KM_AKHIR,
                              arguments: {"data": e});
                          if (res != null) {
                            controller.page.value = 1;
                            controller.lastPage.value = 1;
                            controller.dataP2h.clear();
                            controller.getP2hSarana(controller.page.value);
                          }
                        },
                        child: const Center(
                            child: Text(
                          "Update HM / KM Akhir",
                          textAlign: TextAlign.center,
                        ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: (e.totalTemuan! > 0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.LIHAT_TEMUAN_P2H,
                                  arguments: {"data": e});
                            },
                            child: const Text("Lihat Temuan")),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.P2H_DETAIL,
                                arguments: {"detailP2h": e});
                          },
                          child: const Text("Detail")),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                (e.p2hTglAwal != null)
                    ? controller.fmt.format(DateTime.parse("${e.p2hTglAwal}"))
                    : "",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
