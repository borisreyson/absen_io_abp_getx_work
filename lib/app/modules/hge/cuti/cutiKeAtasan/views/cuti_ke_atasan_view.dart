import 'package:face_id_plus/app/data/utils/custom_footer.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/cuti_ke_atasan_controller.dart';

class CutiKeAtasanView extends GetView<CutiKeAtasanController> {
  const CutiKeAtasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 71, 9),
          title: const Text('Pengajuan Cuti Ke Atasan'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 173, 170, 170),
        body: SmartRefresher(
          footer: const MyCustomFooter(),
          enablePullDown: true,
          enablePullUp: controller.pullUp.value,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          header: const WaterDropMaterialHeader(
            backgroundColor: Color.fromARGB(255, 7, 71, 9),
            color: Colors.white,
          ),
          controller: controller.refreshCtrl,
          child: (controller.loaded.value)
              ? ListView(
                  children: controller.dataCuti
                      .map(
                        (e) => cardCuti(e),
                      )
                      .toList(),
                )
              : const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
        ),
      ),
    );
  }

  Widget cardCuti(Data e) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.DETAI_CUTI, arguments: {"data": e});
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (e.atasanVerifikasi != null)
                      ? (e.deptHeadVerifikasi != null)
                          ? (e.kttVerifikasi != null)
                              ? (e.hcVerifikasi != null)
                                  ? (e.userBatalVerifikasi == null)
                                      ? pdfViewer(e)
                                      : const Center()
                                  : const Center()
                              : const Center()
                          : const Center()
                      : const Center(),
                  (e.userBatalVerifikasi != null)
                      ? dibatalkan(e)
                      : (e.atasanVerifikasi != null)
                          ? (e.deptHeadVerifikasi != null)
                              ? (e.kttVerifikasi != null)
                                  ? (e.hcVerifikasi != null)
                                      ? disetujui(e)
                                      : belumDisetujui(e, "Human Capital Site")
                                  : belumDisetujui(e, "KTT / Mine Manager")
                              : belumDisetujui(e, "Dept Head")
                          : belumDisetujui(e, "Atasan")
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 1,
              color: Colors.black,
              margin: const EdgeInsets.only(top: 5, bottom: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: dataKaryawan(e),
            ),
            if (e.atasanVerifikasi != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: (e.userBatalVerifikasi != null)
                      ? dibatalkan(e)
                      : (e.atasanVerifikasi != null)
                          ? disetujui(e)
                          : const Center(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Card dibatalkan(Data e) {
    return const Card(
      color: Color.fromARGB(255, 244, 158, 151),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          "Dibatalkan",
          style: TextStyle(
              color: Color.fromARGB(255, 156, 12, 1),
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Card belumDisetujui(Data e, String judul) {
    return Card(
      color: const Color.fromARGB(255, 239, 182, 96),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          "Belum Disetujui $judul",
          style: const TextStyle(
              color: Color.fromARGB(255, 139, 80, 3),
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Card disetujui(Data e) {
    return const Card(
      color: Color.fromARGB(255, 131, 234, 134),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          "Disetujui",
          style: TextStyle(
              color: Color.fromARGB(255, 2, 58, 4),
              fontSize: 11,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget dataKaryawan(Data e) {
    var dari = controller.fmt.format(DateTime.parse("${e.tglMulaiCutiOnline}"));
    var sampai =
        controller.fmt.format(DateTime.parse("${e.tglSelesaiCutiOnline}"));
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
            controller.fmt
                .format(DateTime.parse("${e.tglMulaiBekerjaCutiOnline}")),
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
        if (e.userBatalVerifikasi != null)
          TableRow(children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Dibatalkan Oleh",
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "${e.namaBatal}",
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.right,
              ),
            )
          ]),
        if (e.userBatalVerifikasi != null) batalVerifikasi(e),
        if (e.userBatalVerifikasi != null) keteranganBatalVerifikasi(e),
        if (e.userBatalVerifikasi == null)
          if (e.atasanVerifikasi == null) atasanVerifikasi(e),
      ],
    );
  }

  TableRow batalVerifikasi(Data e) {
    var batal = (e.waktuBatalVerifikasi != null)
        ? controller.fmt.format(DateTime.parse("${e.waktuBatalVerifikasi}"))
        : "";

    var jam = (e.waktuBatalVerifikasi != null)
        ? controller.jam.format(DateTime.parse("${e.waktuBatalVerifikasi}"))
        : "";
    return TableRow(children: [
      const Text(
        "Waktu",
        style: TextStyle(color: Colors.red),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            batal,
            style: const TextStyle(fontSize: 12, color: Colors.red),
          ),
          Text(
            jam,
            style: const TextStyle(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    ]);
  }

  TableRow keteranganBatalVerifikasi(Data e) {
    return TableRow(children: [
      const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          "Keterangan Batal",
          style: TextStyle(color: Colors.red),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          "${e.keteranganBatalVerifikasi}",
          textAlign: TextAlign.end,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    ]);
  }

  TableRow atasanVerifikasi(Data e) {
    return TableRow(children: [
      Card(
        elevation: 10,
        color: Colors.green,
        child: InkWell(
          onTap: () {
            controller.setujuiAtasan(e.idCutiOnline);
          },
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                "Setujui",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      Card(
        elevation: 10,
        color: Colors.red,
        child: InkWell(
          onTap: () {
            controller.batalkanAtasan(e.idCutiOnline);
          },
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                "Batalkan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget pdfViewer(Data e) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CUTI_PDF, arguments: {"data": e});
      },
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Lihat PDF",
          style: TextStyle(
            color: Color.fromARGB(255, 2, 62, 4),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
