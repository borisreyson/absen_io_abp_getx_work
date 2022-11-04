import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../data/models/p2h_pemeriksaan.dart';
import '../controllers/list_pemeriksaan_p2_h_controller.dart';

class ListPemeriksaanP2HView extends GetView<ListPemeriksaanP2HController> {
  const ListPemeriksaanP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Pemeriksaan Sarana'),
          centerTitle: true,
        ),
        body: (controller.loaded.value)
            ? Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: ListView(
                      children:
                          controller.data.map((e) => cardItem(e)).toList(),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
      ),
    );
  }

  Widget cardItem(P2hPemeriksaan e) {
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
                  Flexible(
                    child: Text(
                      "${e.diperiksa}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        (e.p2hKetersediaan?.capitalize ?? ""),
                        style: TextStyle(
                            color: (e.p2hKetersediaan == "ada")
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      if (e.p2hKetersediaan != null)
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("- Kondisi"),
                  ),
                  Row(
                    children: [
                      Text(
                        (e.p2hKondisi == "baik")
                            ? "Baik"
                            : (e.p2hKondisi == "tidak_baik")
                                ? "Tidak Baik"
                                : "-",
                        style: TextStyle(
                            color: (e.p2hKondisi == "baik")
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      if (e.p2hKondisi != null)
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
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
