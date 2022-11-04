import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/p2h_controller.dart';

class P2hView extends GetView<P2hController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P2H FORM'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.P2H_OPTION_1);
        },
        label: Row(
          children: const [
            Text("Lanjut"),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              formHeader(),
            ],
          ),
        ],
      ),
    );
  }

  Widget formHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      labelText: "Jenis Peralatan",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: controller.warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan jenis peralatan'),
                  // controller: controller.sarana.value,
                  readOnly: true,
                  onTap: () async {
                    // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                    // if (sarana != null) {
                    //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                    // }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Jenis Peralatan Tidak Boleh Kosong";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      labelText: "Kode Unit",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: controller.warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan kode unit'),
                  // controller: controller.sarana.value,
                  readOnly: true,
                  onTap: () async {
                    // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                    // if (sarana != null) {
                    //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                    // }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Kode Unit Tidak Boleh Kosong";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      labelText: "No Pol/Lamb",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: controller.warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan No Pol/Lamb'),
                  // controller: controller.sarana.value,
                  readOnly: true,
                  onTap: () async {
                    // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                    // if (sarana != null) {
                    //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                    // }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "No Pol/Lamb Tidak Boleh Kosong";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      labelText: "Driver / Pengemudi",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: controller.warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan Driver / Pengemudi'),
                  // controller: controller.sarana.value,
                  readOnly: true,
                  onTap: () async {
                    // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                    // if (sarana != null) {
                    //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                    // }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "No Pol/Lamb Tidak Boleh Kosong";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      labelText: "Shift",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: controller.warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan No Pol/Lamb'),
                  // controller: controller.sarana.value,
                  readOnly: true,
                  onTap: () async {
                    // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                    // if (sarana != null) {
                    //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                    // }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "No Pol/Lamb Tidak Boleh Kosong";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      labelText: "HM / KM Awal",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: controller.warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan HM / KM Awal'),
                  // controller: controller.sarana.value,
                  readOnly: true,
                  onTap: () async {
                    // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                    // if (sarana != null) {
                    //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                    // }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "HM / KM Awal Tidak Boleh Kosong";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: controller.warna, width: 2),
                      ),
                      labelText: "HM / KM Akhir",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: controller.warna),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      fillColor: Colors.green,
                      hintText: 'Masukkan HM / KM Akhir'),
                  // controller: controller.sarana.value,
                  readOnly: true,
                  onTap: () async {
                    // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                    // if (sarana != null) {
                    //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                    // }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "HM / KM Akhir Tidak Boleh Kosong";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: controller.warna, width: 2),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: controller.warna, width: 2),
                    ),
                    labelText: "Departemen",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: controller.warna),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    fillColor: Colors.green,
                    hintText: 'Masukkan Departemen'),
                // controller: controller.sarana.value,
                readOnly: true,
                onTap: () async {
                  // DataSarana sarana = await Get.toNamed(Routes.LIST_CAR);
                  // if (sarana != null) {
                  //   controller.sarana.value.text = "${sarana.noLv} (${sarana.noPol})";
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
