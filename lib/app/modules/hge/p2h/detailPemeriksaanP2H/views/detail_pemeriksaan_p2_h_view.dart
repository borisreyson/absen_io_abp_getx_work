import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/models/p2h_sarana_mode.dart';
import '../controllers/detail_pemeriksaan_p2_h_controller.dart';

class DetailPemeriksaanP2HView extends GetView<DetailPemeriksaanP2HController> {
  const DetailPemeriksaanP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 100),
              child: widgetPemeriksaan(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: Colors.blue,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70,
                    width: Get.width,
                    child: widgetHeader(controller.header.value),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget widgetPemeriksaan() {
    return ListView(
      children: [
        Center(
          child: Text(
            "${controller.data.value.diperiksa}",
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Ketersediaan",
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: (controller.tersedia.value == "ada")
                  ? null
                  : () {
                      controller.ketersediaan("ada");
                    },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Ada"),
            ),
            ElevatedButton(
              onPressed: (controller.tersedia.value == "tidak")
                  ? null
                  : () {
                      controller.ketersediaan("tidak");
                    },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Tidak Ada"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Kondisi",
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: (controller.kondisinya.value == "baik")
                  ? null
                  : (controller.tersedia.value == "ada")
                      ? () {
                          controller.kondisi("baik");
                        }
                      : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Baik"),
            ),
            ElevatedButton(
              onPressed: (controller.kondisinya.value == "tidak_baik")
                  ? null
                  : (controller.tersedia.value == "ada")
                      ? () async {
                          var res = await Get.toNamed(
                              Routes.KETERANGAN_KONDISI_P2H,
                              arguments: {
                                "data": controller.data.value,
                                "header": controller.header.value
                              });
                          if (res != null) {
                            if (res) {
                              controller.cekKondisi();
                            }
                          }
                        }
                      : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Tidak Baik"),
            ),
            if (controller.kondisinya.value == "tidak_baik")
              ListTile(
                title: const Icon(
                  Icons.warning_amber_rounded,
                  size: 40,
                  color: Colors.red,
                ),
                subtitle: Text(
                  "- ${controller.keterangannya.value}",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            if (controller.gambarKondisi.value != null)
              SizedBox(
                width: 200,
                height: 200,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.VIEW_IMAGE, arguments: {
                      "urlImage":
                          "${controller.basUrl}${controller.gambarKondisi.value}"
                    });
                  },
                  child: CachedNetworkImage(
                    imageUrl:
                        "${controller.basUrl}${controller.gambarKondisi.value}",
                    fit: BoxFit.cover,
                    placeholder: (contex, url) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image_rounded,
                          size: 150,
                          color: Color.fromARGB(255, 235, 104, 95),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget widgetHeader(P2HSaranaModel e) => Table(
        border: TableBorder.all(
            color: Colors.white, width: 1, style: BorderStyle.solid),
        children: [
          TableRow(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Nomor Polisi",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      );
}
