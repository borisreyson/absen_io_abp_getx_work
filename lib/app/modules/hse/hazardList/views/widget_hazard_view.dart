import 'package:face_id_plus/app/data/models/data_hazard.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/hazard_model.dart';
import '../../../../data/providers/provider.dart';
import '../../../../data/utils/constants.dart';

class WidgetHazardView extends GetView {
  // ignore: prefer_typing_uninitialized_variables
  final Data data;
  final String? _rule;
  final String username;
  final String? option;
  final int? disetujui;
  final Function onRefresh;
  const WidgetHazardView(this.data, this._rule, this.onRefresh,
      {required this.username, this.option, this.disetujui, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color success = Colors.green.shade700;
    final Color danger = Colors.red.shade700;

    const TextStyle colorText = TextStyle(color: Colors.white);

    var fmt = DateFormat("dd MMMM yyyy");
    String? status;
    if (data.userValid == null) {
      status = "Belum Disetujui";
    } else if (data.userValid != null &&
        (data.optionFlag == 1 || data.optionFlag == null)) {
      status = "Disetujui";
    } else if (data.optionFlag == 0) {
      status = "Dibatalkan";
    }

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: InkWell(
          onTap: () async {
            await Get.toNamed(Routes.DETAIL_HAZARD,
                arguments: {"detail": data});
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                color: (data.statusPerbaikan != "SELESAI") ? danger : success,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${data.jamHazard}",
                      style: colorText,
                    ),
                    Text(fmt.format(DateTime.parse(data.tglHazard!)),
                        style: colorText)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Perusahaan"),
                        Text("${data.perusahaan}"),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Lokasi"),
                        Text("${data.lokasiHazard}"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: (data.statusPerbaikan != "SELESAI") ? danger : success,
                padding: const EdgeInsets.all(10),
                child: const Center(
                    child: Text(
                  "Deskripsi",
                  style: colorText,
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Center(child: Text("${data.deskripsi}")),
              ),
              Container(
                color: (data.statusPerbaikan != "SELESAI") ? danger : success,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  "${data.statusPerbaikan}",
                  style: colorText,
                )),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dibuat",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${data.namaLengkap}"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Penanggung Jawab",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("${data.namaPJ}"),
                  ],
                ),
              ),
              Container(
                color: (status == "Disetujui") ? success : danger,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  "$status",
                  style: colorText,
                )),
              ),
              Visibility(
                visible: (data.keteranganAdmin != null)
                    ? (status == "Dibatalkan")
                        ? true
                        : false
                    : false,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    "${data.keteranganAdmin}",
                  )),
                ),
              ),
              aksiBtn(status),
            ],
          ),
        ));
  }

  Widget aksiBtn(String? status) {
    return Visibility(
      visible: (_rule != null) ? true : false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Persetujuan
          Visibility(
            visible: (_rule!.contains("admin_hse"))
                ? (status == "Disetujui" || status == "Dibatalkan")
                    ? false
                    : (option == "all")
                        ? true
                        : false
                : false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      bool alert = await Constants().showAlert(
                        judul: "Setujui Hazard",
                        del: true,
                        msg: "Apakah anda yakin?",
                        fBtn: "Ya, Setujui",
                        sBtn: "Batal",
                      );
                      if (alert) {
                        Constants().showAlert(
                            dismiss: false, loading: true, enBtn: false);
                        var verify = HazardVerify();
                        verify.uid = data.uid;
                        verify.keterangan = "";
                        verify.username = username;
                        verify.option = 1;
                        await HazardProvider()
                            .verifyHazard(verify)
                            .then((res) async {
                          if (res != null) {
                            if (res.success!) {
                              await onRefresh(s: true);
                              Get.back();
                            }
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade700),
                    child: const Text("Setujui")),
                ElevatedButton(
                    onPressed: () async {
                      var alert = await Constants().showFormAlert(
                        judul: "Keterangan Pembatalan",
                        label: "Keterangan Pembatalan",
                        fBtn: "Ya, Batalkan",
                        sBtn: "Batal",
                      );
                      if (alert[0]) {
                        Constants().showAlert(
                            dismiss: false, loading: true, enBtn: false);
                        var verify = HazardVerify();
                        verify.keterangan = alert[1];
                        verify.uid = data.uid;
                        verify.username = username;
                        verify.option = 0;
                        await HazardProvider()
                            .verifyHazard(verify)
                            .then((res) async {
                          if (res != null) {
                            if (res.success!) {
                              await onRefresh(s: true);
                              Get.back();
                            }
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    child: const Text("Batalkan")),
              ],
            ),
          ),
          //Administrator
          Visibility(
            visible: (!_rule!.contains("administrator"))
                ? false
                : (option == "all")
                    ? true
                    : false,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                onPressed: () async {
                  bool alert = await Constants().showAlert(
                      judul: "Hapus Hazard Report",
                      del: true,
                      msg: "Apakah anda yakin?",
                      fBtn: "Ya, Hapus",
                      sBtn: "Tidak");
                  if (alert) {
                    Constants()
                        .showAlert(dismiss: false, loading: true, enBtn: false);

                    await HazardProvider().deleteHazard(data.uid).then((res) {
                      if (res != null) {
                        if (res.success) {
                          Get.back(result: "suceess");
                          onRefresh(s: true);
                        } else {
                          Get.back();
                          Constants().showAlert(
                              judul: "Error",
                              enBtn: true,
                              msg: "Gagal Menghapus!");
                        }
                      } else {
                        Get.back();
                        Constants().showAlert(
                            judul: "Error",
                            enBtn: true,
                            msg: "Gagal Menghapus!");
                      }
                    });
                  }
                },
                child: const Text("Hapus")),
          ),

          Row(
            mainAxisAlignment: (data.statusPerbaikan != "SELESAI")
                ? (disetujui != 2)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: [
              //User
              Visibility(
                visible: (option == "all")
                    ? false
                    : (disetujui == 2)
                        ? true
                        : false,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                    onPressed: () async {
                      bool alert = await Constants().showAlert(
                          judul: "Rubah Hazard Report",
                          del: true,
                          msg: "Apakah anda yakin?",
                          fBtn: "Ya, Rubah",
                          sBtn: "Tidak");
                      if (alert) {
                        Constants().showAlert(
                            dismiss: false, loading: true, enBtn: false);
                        var stat = await Get.toNamed(Routes.RUBAH_HAZARD,
                            arguments: {"detail": data});

                        if (stat) {
                          Get.back(result: stat);
                          onRefresh(s: stat);
                        } else {
                          Get.back(result: stat);
                        }
                      }
                    },
                    child: const Text("Rubah")),
              ),
              (option == "all")
                  ? Visibility(
                      visible: false,
                      child: Container(),
                    )
                  : (data.statusPerbaikan != "SELESAI")
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 68, 59, 162)),
                          onPressed: () async {
                            bool alert = await Constants().showAlert(
                                judul: "Update Hazard Report",
                                del: true,
                                msg: "Apakah anda yakin?",
                                fBtn: "Ya, Update Hazard",
                                sBtn: "Tidak");
                            if (alert) {
                              Constants().showAlert(
                                  dismiss: false, loading: true, enBtn: false);
                              var stat = await Get.toNamed(Routes.RUBAH_STATUS,
                                  arguments: {"detail": data});
                              if (stat) {
                                Get.back(result: stat);
                                onRefresh(s: true);
                              } else {
                                Get.back(result: stat);
                              }
                            }
                          },
                          child: const Text("Update Hazard"))
                      : Visibility(
                          visible: false,
                          child: Container(),
                        ),
            ],
          ),

          //Jarak
          Visibility(
              visible: (option != "all"),
              child: const SizedBox(
                height: 20,
              ))
        ],
      ),
    );
  }
}
