import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/models/master_pemeriksaan_model.dart';
import '../../../../../data/models/p2h_sarana_mode.dart';
import '../controllers/daftar_pemeriksaan_p2_h_controller.dart';

class DaftarPemeriksaanP2HView extends GetView<DaftarPemeriksaanP2HController> {
  const DaftarPemeriksaanP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: floatingAction(),
        appBar: AppBar(
          title: const Text('Daftar Pemeriksaan Sarana'),
          centerTitle: true,
        ),
        body: (controller.loaded.value)
            ? ListView(
                children: [
                  unCheckedColumn(),
                  checkedColumn(),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
      ),
    );
  }

  Widget widgetHeader(P2HSaranaModel e, jumlah) => Column(
        children: [
          Table(
            border: TableBorder.all(
                color: Colors.white, width: 1, style: BorderStyle.solid),
            children: [
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Nomor Polisi",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${e.noPol}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Nomor Lambung",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${e.noLv}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: Get.width,
            child: ElevatedButton(
              onPressed: (controller.data.length > jumlah)
                  ? null
                  : () {
                      controller.selesaiP2h();
                    },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, elevation: 10),
              child: const Text(
                "Selesai",
                style: TextStyle(color: Colors.green),
              ),
            ),
          )
        ],
      );

  Widget checkedColumn() {
    return Column(
      children: controller.data
          .map((e) => cardChecked(e, controller.dataHeader.value))
          .toList(),
    );
  }

  Widget unCheckedColumn() {
    return Column(
      children: controller.data
          .map((e) => cardUnChecked(e, controller.dataHeader.value))
          .toList(),
    );
  }

  Widget cardChecked(MasterPemeriksaan e, P2HSaranaModel header) {
    return FutureBuilder(
      future: controller.cekKondisi(e.idPemeriksaan, header.idHeader),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!) {
            return checkedItem(e, header);
          } else {
            return Visibility(visible: false, child: Container());
          }
        }
        return Visibility(visible: false, child: Container());
      },
    );
  }

  Widget cardUnChecked(MasterPemeriksaan e, P2HSaranaModel header) {
    return FutureBuilder(
      future: controller.cekKondisi(e.idPemeriksaan, header.idHeader),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (!snapshot.data!) {
            return unCheckedItem(e, header);
          }
          return Visibility(visible: false, child: Container());
        }
        return Visibility(visible: false, child: Container());
      },
    );
  }

  Widget checkedItem(MasterPemeriksaan e, P2HSaranaModel header) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "${e.diperiksa}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check_circle_sharp,
                    color: Colors.green,
                  ),
                  Card(
                    color: Colors.blue,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () async {
                        controller.loaded.value = false;
                        await Get.toNamed(Routes.DETAIL_PEMERIKSAAN_P2_H,
                            arguments: {"data": e, "header": header});
                        await controller.reloadData();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          CupertinoIcons.doc_text,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          width: Get.width,
          height: 1,
        )
      ],
    );
  }

  Widget unCheckedItem(MasterPemeriksaan e, P2HSaranaModel header) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "${e.diperiksa}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Card(
                color: Colors.blue,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () async {
                    controller.loaded.value = false;
                    await Get.toNamed(Routes.DETAIL_PEMERIKSAAN_P2_H,
                        arguments: {"data": e, "header": header});
                    await controller.reloadData();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      CupertinoIcons.doc_text,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          width: Get.width,
          height: 1,
        )
      ],
    );
  }

  showDialog(jumlah) {
    return Get.bottomSheet(
      Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Card(
              color: Colors.blue,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 125,
                  width: Get.width,
                  child: widgetHeader(controller.dataHeader.value, jumlah),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton floatingAction() {
    return FloatingActionButton.extended(
      onPressed: () async {
        controller.menuOpen.value = false;
        await controller.serviceKondisi
            .getByHeader(idHeader: "${controller.idHeader.value}")
            .then((value) async {
          var jumlah = value.length;
          await showDialog(jumlah);
        });
        controller.menuOpen.value = true;
      },
      label: const Text("Lanjut"),
    );
  }
}
