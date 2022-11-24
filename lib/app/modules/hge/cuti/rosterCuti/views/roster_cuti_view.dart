import 'package:flutter/material.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/roster_cuti_karyawan.dart';
import 'package:get/get.dart';
import '../controllers/roster_cuti_controller.dart';

class RosterCutiView extends GetView<RosterCutiController> {
  const RosterCutiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Roster Cuti'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            cardHeader(),
            cardUbah(context),
            Column(
              children: controller.rosterCuti.map((e) => cardCuti(e)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget cardHeader() {
    var hariIni = controller.fmt.format(DateTime.now());
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Nik"),
              Text(
                "${controller.nik.value}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Nama"),
              Text(
                "${controller.nama.value}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tanggal"),
              Text(
                hariIni,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardUbah(context) {
    return Container(
      color: (controller.textPeneyesuaian.value != null)
          ? Colors.green
          : Colors.white,
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          if (controller.textPeneyesuaian.value != null)
            SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Penyesuaian Tanggal Cuti",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: (controller.textPeneyesuaian.value != null)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${controller.textPeneyesuaian.value}",
                          style: TextStyle(
                            color: (controller.textPeneyesuaian.value != null)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor:
                                    const Color.fromARGB(255, 117, 116, 116)),
                            onPressed: () {
                              
                              Get.back(result: controller.dataSend.value);
                            },
                            child: const Text("Pilih",
                                style: TextStyle(color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(
            width: Get.width / 1.5,
            child: Card(
              color: Colors.blueGrey,
              elevation: 10,
              child: InkWell(
                onTap: () async {
                  await _showBottomDialog(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    "Pilih Penyesuaian Tanggal Cuti",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardCuti(Data e) {
    var a = DateTime.parse("${e.tglMulaiCuti}");
    var b = DateTime.parse("${e.tglSelesaiCuti}");
    var c = DateTime(a.year, a.month, 1);
    var d = DateTime(b.year, b.month, 0);
    var sekarang = DateTime.now();
    var mulai = controller.fmt.format(a);
    var selesai = controller.fmt.format(b);
    var compare = b.difference(a);
    return Card(
      margin: const EdgeInsets.all(10),
      color: (sekarang.isAfter(c) && sekarang.isBefore(d))
          ? Colors.green
          : (sekarang.isAfter(b))
              ? Colors.red
              : Colors.orange,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Tanggal Cuti",
              style: TextStyle(
                  color: (sekarang.isAfter(c) && sekarang.isBefore(d))
                      ? Colors.white
                      : (sekarang.isAfter(b))
                          ? Colors.white
                          : Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mulai,
                  style: TextStyle(
                      color: (sekarang.isAfter(c) && sekarang.isBefore(d))
                          ? Colors.white
                          : (sekarang.isAfter(b))
                              ? Colors.white
                              : Colors.white),
                ),
                Text(
                  " - ",
                  style: TextStyle(
                      color: (sekarang.isAfter(c) && sekarang.isBefore(d))
                          ? Colors.white
                          : (sekarang.isAfter(b))
                              ? Colors.white
                              : Colors.white),
                ),
                Text(
                  selesai,
                  style: TextStyle(
                      color: (sekarang.isAfter(c) && sekarang.isBefore(d))
                          ? Colors.white
                          : (sekarang.isAfter(b))
                              ? Colors.white
                              : Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Lama Cuti",
                  style: TextStyle(
                      color: (sekarang.isAfter(c) && sekarang.isBefore(d))
                          ? Colors.white
                          : (sekarang.isAfter(b))
                              ? Colors.white
                              : Colors.white),
                ),
                Text(
                  "${compare.inDays + 1}",
                  style: TextStyle(
                      color: (sekarang.isAfter(c) && sekarang.isBefore(d))
                          ? Colors.white
                          : (sekarang.isAfter(b))
                              ? Colors.white
                              : Colors.white),
                ),
              ],
            ),
            if (!sekarang.isAfter(b) ||
                (sekarang.isAfter(c) && sekarang.isBefore(d)))
              if (controller.argumen.value)
                SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor:
                            const Color.fromARGB(255, 117, 116, 116)),
                    onPressed: () {
                      Get.back(result: e);
                    },
                    child: const Text("Pilih",
                        style: TextStyle(color: Colors.black)),
                  ),
                )
          ],
        ),
      ),
    );
  }

  _showBottomDialog(context) {
    controller.sampai.value = controller.dt;
    controller.sampai.value = DateTime(controller.sampai.value.year,
        controller.sampai.value.month, controller.sampai.value.day + 13);
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return Stack(
            children: [
              Card(
                margin: const EdgeInsets.only(top: 40),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      controller.tglPick("Dari", controller.dari.value),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.tglPick("Sampai", controller.sampai.value),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.submitWidgetDTrange()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        customBorder: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                      )),
                ),
              )
            ],
          );
        });
  }
}
