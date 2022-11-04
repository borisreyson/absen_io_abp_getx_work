import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';
import 'package:flutter/material.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart'
    as cuti_model;
import 'package:get/get.dart';
import '../controllers/detai_cuti_controller.dart';

class DetaiCutiView extends GetView<DetaiCutiController> {
  const DetaiCutiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Detail Cuti'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 169, 166, 166),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              dataKaryawan(controller.dataCuti.value),
              if (controller.dataCuti.value.tiketPesawatCutiOnline == 1)
                tiketHeader(),
              tableVerifikasi(controller.dataCuti.value),
            ],
          ),
        ),
      ),
    );
  }

  Widget tableVerifikasi(Data e) {
    return Card(
      margin: const EdgeInsets.only(left: 4, right: 4, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            child: const Center(
                child: Text(
              "Status",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Table(
              border: TableBorder.all(color: Colors.blue, width: 1),
              children: [
                atasanVerifikasi(e),
                deptHeadVerifikasi(e),
                kttVerifikasi(e),
                hcVerifikasi(e),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tiketHeader() {
    return Column(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text("PEMESANAN TIKET PESAWAT"),
          ),
        ),
        (controller.loaded.value)
            ? Column(
                children:
                    controller.tiketCuti.map((e) => tiketPesawat(e)).toList(),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
      ],
    );
  }

  Widget dataKaryawan(cuti_model.Data e) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: tbDataKaryawan(e),
      ),
    );
  }

  Widget tbDataKaryawan(cuti_model.Data e) {
    var dari = (e.tglMulaiCutiOnline != null)
        ? controller.fmt.format(DateTime.parse("${e.tglMulaiCutiOnline}"))
        : "";
    var sampai = (e.tglSelesaiCutiOnline != null)
        ? controller.fmt.format(DateTime.parse("${e.tglSelesaiCutiOnline}"))
        : "";
    return Table(
      children: [
        TableRow(children: [
          const Text("Nama"),
          Text(
            "${e.namaCutiOnline}",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Satus Keluarga"),
          Text(
            "${e.statusKeluargaCutiOnline}",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("NRP / NIK"),
          Text(
            "${e.nikCutiOnline}",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Tanggal Mulai Bekerja"),
          Text(
            (e.tglMulaiBekerjaCutiOnline != null)
                ? controller.fmt
                    .format(DateTime.parse("${e.tglMulaiBekerjaCutiOnline}"))
                : "",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Alamat"),
          Text(
            "${e.alamatCutiOnline}",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Status Penerimaan"),
          Text(
            "${e.statusKaryawanCutiOnline}",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Membawa Keluarga"),
          Text(
            (e.membawaKeluargacutiOnline != null)
                ? (e.membawaKeluargacutiOnline! == 1)
                    ? "Ya"
                    : "Tidak"
                : "Tidak",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Tgl. Membawa Keluarga"),
          Text(
            (e.tglMembawaKeluargaCutiOnline != null)
                ? controller.fmt
                    .format(DateTime.parse("${e.tglMembawaKeluargaCutiOnline}"))
                : "-",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Jenis Cuti"),
          Text(
            "${e.jenisCutiOnline}",
            textAlign: TextAlign.right,
          ),
        ]),
        TableRow(children: [
          const Text("Tgl.Cuti"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                dari,
                textAlign: TextAlign.right,
              ),
              Text(
                sampai,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Widget pengajuan() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Table(
          children: [
            TableRow(children: [
              const Text("1. Cuti Lapangan"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "1 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "14 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ]),
            TableRow(children: [
              const Text("2. Cuti Tahunan"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "1 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "14 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ]),
            TableRow(children: [
              const Text("3. Seminal / Training"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "1 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "14 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ]),
            TableRow(children: [
              const Text("4. Cuti Besar (5 tahun)"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "1 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "14 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ]),
            TableRow(children: [
              const Text("5. Istirahat Ditempat"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "1 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "14 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ]),
            TableRow(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("6. "),
                  Flexible(
                      child: Text("Cuti Besar Dikompesasikan Dengan Uang")),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "1 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "14 Juni 2022",
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ]),
            const TableRow(children: [
              Text("Berangkat dari Job Site"),
              Text(
                "1 Juni 2022",
                textAlign: TextAlign.right,
              ),
            ]),
            const TableRow(children: [
              Text("Kembali Ke Job Site"),
              Text(
                "15 Juni 2022",
                textAlign: TextAlign.right,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget tiketPesawat(TiketCuti e) {
    var berangkat = (e.tglTerbangCutiOnline != null)
        ? controller.fmt.format(DateTime.parse("${e.tglTerbangCutiOnline}"))
        : "";
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          children: [
            TableRow(children: [
              const Text("Berangkat"),
              Text(
                "${e.berangkatCutiOnline}",
                textAlign: TextAlign.right,
              ),
            ]),
            TableRow(children: [
              const Text("Tujuan"),
              Text(
                "${e.tujuanCutiOnline}",
                textAlign: TextAlign.right,
              ),
            ]),
            TableRow(children: [
              const Text("Tanggal Terbang"),
              Text(
                berangkat,
                textAlign: TextAlign.right,
              ),
            ]),
            TableRow(children: [
              const Text("Jam"),
              Text(
                "${e.jamTerbangCutiOnline}",
                textAlign: TextAlign.right,
              ),
            ]),
            TableRow(children: [
              const Text("Maskapai"),
              Text(
                "${e.maskapaiCutiOnline}",
                textAlign: TextAlign.right,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  TableRow atasanVerifikasi(Data e) {
    var atasan = (e.waktuAtasanVerifikasi != null)
        ? controller.fmt.format(DateTime.parse("${e.waktuAtasanVerifikasi}"))
        : "";
    var jam = (e.waktuAtasanVerifikasi != null)
        ? controller.jam.format(DateTime.parse("${e.waktuAtasanVerifikasi}"))
        : "";
    return TableRow(children: [
      const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Atasan Langsung",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (e.atasanVerifikasi != null) ? "Disetujui" : "Belum Disetujui",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (e.atasanVerifikasi != null)
                    ? const Color.fromARGB(255, 11, 88, 13)
                    : Colors.red,
              ),
            ),
            if (e.kttVerifikasi != null)
              CachedNetworkImage(
                imageUrl: "https://abpjobsite.com/ttd/${e.ttdAtasan}",
                height: 50,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              ),
            if (e.atasanVerifikasi != null)
              Text(
                " ${e.namaAtasan}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 88, 13)),
              ),
            if (e.atasanVerifikasi != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    atasan,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    jam,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
      ),
    ]);
  }

  TableRow deptHeadVerifikasi(Data e) {
    var deptHead = (e.waktuDeptHeadVerifikasi != null)
        ? controller.fmt.format(DateTime.parse("${e.waktuDeptHeadVerifikasi}"))
        : "";

    var jam = (e.waktuDeptHeadVerifikasi != null)
        ? controller.jam.format(DateTime.parse("${e.waktuDeptHeadVerifikasi}"))
        : "";
    return TableRow(children: [
      const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Dept Head",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (e.deptHeadVerifikasi != null) ? "Disetujui" : "Belum Disetujui",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (e.deptHeadVerifikasi != null)
                    ? const Color.fromARGB(255, 11, 88, 13)
                    : Colors.red,
              ),
            ),
            if (e.kttVerifikasi != null)
              CachedNetworkImage(
                imageUrl: "https://abpjobsite.com/ttd/${e.ttdDeptHead}",
                height: 50,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              ),
            if (e.deptHeadVerifikasi != null)
              Text(" ${e.namaDeptHead}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 88, 13))),
            if (e.waktuDeptHeadVerifikasi != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    deptHead,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    jam,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
      ),
    ]);
  }

  TableRow kttVerifikasi(Data e) {
    var ktt = (e.waktuKttVerifikasi != null)
        ? controller.fmt.format(DateTime.parse("${e.waktuKttVerifikasi}"))
        : "";
    var jam = (e.waktuKttVerifikasi != null)
        ? controller.jam.format(DateTime.parse("${e.waktuKttVerifikasi}"))
        : "";
    return TableRow(children: [
      const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "KTT / Mine Manager",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (e.kttVerifikasi != null) ? "Disetujui" : "Belum Disetujui",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (e.kttVerifikasi != null)
                    ? const Color.fromARGB(255, 11, 88, 13)
                    : Colors.red,
              ),
            ),
            if (e.kttVerifikasi != null)
              CachedNetworkImage(
                imageUrl: "https://abpjobsite.com/ttd/${e.ttdKtt}",
                height: 50,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              ),
            if (e.kttVerifikasi != null)
              Text(" ${e.namaKtt}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 88, 13))),
            if (e.kttVerifikasi != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ktt,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    jam,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
      ),
    ]);
  }

  TableRow hcVerifikasi(Data e) {
    var ktt = (e.waktuHcVerifikasi != null)
        ? controller.fmt.format(DateTime.parse("${e.waktuHcVerifikasi}"))
        : "";
    var jam = (e.waktuHcVerifikasi != null)
        ? controller.jam.format(DateTime.parse("${e.waktuHcVerifikasi}"))
        : "";
    return TableRow(children: [
      const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Human Capital Site",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (e.hcVerifikasi != null) ? "Disetujui" : "Belum Disetujui",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (e.hcVerifikasi != null)
                    ? const Color.fromARGB(255, 11, 88, 13)
                    : Colors.red,
              ),
            ),
            if (e.hcVerifikasi != null)
              CachedNetworkImage(
                imageUrl: "https://abpjobsite.com/ttd/${e.ttdHc}",
                height: 50,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              ),
            if (e.hcVerifikasi != null)
              Text(" ${e.namaHc}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 88, 13))),
            if (e.hcVerifikasi != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ktt,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    jam,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
      ),
    ]);
  }
}
