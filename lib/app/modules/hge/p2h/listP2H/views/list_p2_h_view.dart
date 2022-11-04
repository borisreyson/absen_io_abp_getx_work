import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_p2_h_controller.dart';

class ListP2HView extends GetView<ListP2HController> {
  const ListP2HView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          cardP2H(),
        ],
      ),
    );
  }

  Widget cardP2H() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.P2H_DETAIL, arguments: {"id_p2h": 1});
        },
        child: Stack(
          children: [
            Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 40, right: 10, bottom: 10),
                child: Table(
                  key: key,
                  children: const [
                    TableRow(
                      children: [
                        Text(
                          "NO POL / LAMBUNG",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "LV 01",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "TANGGAL",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "30 AGUSTUS 2022",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "SHIFT",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "1",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "HM / KM AWAL",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "1000",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "HM / KM AKHIR",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "1500",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "DI P2H OLEH",
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "BORIS REYSON SITORUS BOLTOX PT ALAMJAYA BARA PRATAMA",
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "Departemen",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "HCGA & EXTERNAL",
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          "Temuan",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "10",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Card(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "30 AGUSTUS 2022",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
