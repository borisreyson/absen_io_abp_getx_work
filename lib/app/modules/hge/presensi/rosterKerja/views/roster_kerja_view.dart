import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../data/models/rosterkerja.dart';
import '../controllers/roster_kerja_controller.dart';

class RosterKerjaView extends GetView<RosterKerjaController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Scrollable.ensureVisible(controller.dataKey.currentContext!);
          },
          child: const Icon(Icons.arrow_downward_rounded),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          title: const Text('Roster Kerja'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children:
                  controller.listRoster.map((e) => cartRoster(e)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget cartRoster(Roster roster) {
    var dt = DateTime.now();
    var m = "${dt.month}".padLeft(2, "0");
    var day = "${dt.day}".padLeft(2, "0");
    var sekarang = "${dt.year}-$m-$day";
    var fmt = DateFormat("dd MMMM yyyy");
    var tgl = DateTime.parse("${roster.tanggal}");
    print("$sekarang == ${roster.tanggal}");
    return Card(
      key: (sekarang == roster.tanggal) ? controller.dataKey : null,
      color: (roster.kodeJam != "OFF")
          ? (sekarang == roster.tanggal)
              ? Colors.green
              : Colors.white
          : (sekarang == roster.tanggal)
              ? Colors.green
              : Colors.red,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(fmt.format(tgl),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: (roster.kodeJam != "OFF")
                        ? (sekarang == roster.tanggal)
                            ? Colors.white
                            : Colors.black
                        : Colors.white)),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 5),
              color: (roster.kodeJam != "OFF")
                  ? (sekarang == roster.tanggal)
                      ? Colors.white
                      : Colors.black
                  : Colors.white,
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Jam Kerja",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (roster.kodeJam != "OFF")
                              ? (sekarang == roster.tanggal)
                                  ? Colors.white
                                  : Colors.black
                              : Colors.white),
                    ),
                    Text(
                      (roster.kodeJam != "OFF")
                          ? "${roster.masuk} - ${roster.pulang}"
                          : '-',
                      style: TextStyle(
                          color: (roster.kodeJam != "OFF")
                              ? (sekarang == roster.tanggal)
                                  ? Colors.white
                                  : Colors.black
                              : Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Kode Kerja",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (roster.kodeJam != "OFF")
                              ? (sekarang == roster.tanggal)
                                  ? Colors.white
                                  : Colors.black
                              : Colors.white),
                    ),
                    Text(
                      "${roster.kodeJam}",
                      style: TextStyle(
                          color: (roster.kodeJam != "OFF")
                              ? (sekarang == roster.tanggal)
                                  ? Colors.white
                                  : Colors.black
                              : Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
