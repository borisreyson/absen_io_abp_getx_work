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
}
