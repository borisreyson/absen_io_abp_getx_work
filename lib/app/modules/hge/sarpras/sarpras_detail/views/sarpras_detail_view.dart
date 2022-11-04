import 'package:face_id_plus/app/data/models/sarpras_list.dart';
import 'package:face_id_plus/app/data/models/sarpras_penumpang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sarpras_detail_controller.dart';

class SarprasDetailView extends GetView<SarprasDetailController> {
  const SarprasDetailView({Key? key}) : super(key: key);
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
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: (controller.loaded.value)
            ? ListView(children: [cardDetail(controller.data.value)])
            : const Center(
                child: CupertinoActivityIndicator(
                  radius: 40,
                ),
              ),
      ),
    );
  }

  Widget cardDetail(Data data) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Nomor",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${data.no}".padLeft(4, "0")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Pemohon",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${data.nama}"),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tanggal Keluar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text((data.tglOut != null)
                  ? controller.fmt.format(DateTime.parse("${data.tglOut}"))
                  : ""),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Jam Keluar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text((data.jamOut != null) ? "${data.jamOut}" : ""),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tanggal Kembali",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text((data.tglIn != null)
                  ? controller.fmt.format(DateTime.parse("${data.tglIn}"))
                  : ""),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Jam Kembali",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text((data.jamIn != null) ? "${data.jamIn}" : ""),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Dibuat",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (data.tglEntry != null)
                        ? controller.fmt
                            .format(DateTime.parse("${data.tglEntry}"))
                        : "",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    (data.tanggalEntry != null)
                        ? controller.jam
                            .format(DateTime.parse(data.tanggalEntry!))
                        : "",
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "No Sarana",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${data.noLv}"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Driver",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${data.namaDriver}"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Keperluan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${data.keperluan}",
                  textAlign: TextAlign.justify,
                ),
              )),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Penumpang",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          if (controller.penumpang.value.penumpang != null)
            Column(
              children: controller.penumpang.value.penumpang!
                  .map((e) => penumpangWidget(e))
                  .toList(),
            ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget penumpangWidget(Penumpang e) {
    return SizedBox(
      width: Get.width,
      child: Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "${e.nik}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        "${e.nama}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        (e.jabatan != null) ? "${e.jabatan}" : "-",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        (e.devisi != null) ? "${e.devisi}" : "-",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${e.dept}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
