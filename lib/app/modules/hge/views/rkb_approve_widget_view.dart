import 'package:face_id_plus/app/data/models/approve_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/models/rkb_models.dart';
import '../../../data/providers/provider.dart';
import '../../../data/utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../rkbsystem/rkb_kabag/controllers/rkb_kabag_controller.dart';

// ignore: must_be_immutable
class RkbApproveWidgetView extends GetView<RkbKabagController> {
  final Data data;
  String username;
  String section;
  RkbApproveWidgetView(
      {required this.data,
      required this.username,
      required this.section,
      Key? key})
      : super(key: key);
  @override
  final controller = Get.find<RkbKabagController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 30, top: 10, left: 10, right: 10),
      elevation: 10,
      child: Column(
        children: [
          header(),
          tanggalWidget(),
          Container(
            height: 1,
            color: Colors.black,
          ),
          namaWidget(),
          Container(
            height: 1,
            color: Colors.black,
          ),
          content(),
          if (data.cancelRemark != null) closeRemark(),
          if (data.remarkCancel != null) cancelRemark(),
          Container(
            height: 1,
            color: Colors.black,
          ),
          footer(),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      color: (data.cancelUser != null)
          ? Colors.red
          : (data.diketahui == "0")
              ? Colors.orange
              : Colors.green,
      child: Center(
        child: Text(
          "${data.noRkb}",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Widget tanggalWidget() {
    DateFormat fmt = DateFormat("dd MMMM yyyy");
    var tgl = DateTime.parse("${data.tglOrder}");
    return Container(
      padding: const EdgeInsets.all(5),
      child: Text(fmt.format(tgl)),
    );
  }

  Widget namaWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${data.namaLengkap}"),
          const Card(
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Created",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget content() {
    DateFormat fmt = DateFormat("dd MMMM yyyy");
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${data.section} - ${data.dept}",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Ka .Bag."),
          Card(
              margin: const EdgeInsets.only(top: 5, bottom: 20),
              color: (data.cancelUser != null)
                  ? Colors.red
                  : (data.disetujui == "0")
                      ? Colors.orange
                      : Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (data.cancelUser != null)
                    ? const Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 15,
                      )
                    : Text(
                        (data.disetujui == "0")
                            ? "Waiting"
                            : (data.tglDisetujui != null)
                                ? fmt.format(
                                    DateTime.parse("${data.tglDisetujui}"))
                                : "Waiting",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 9),
                      ),
              )),
          const Text("KTT."),
          Card(
            margin: const EdgeInsets.only(top: 5, bottom: 20),
            color: (data.cancelUser != null)
                ? Colors.red
                : (data.diketahui == "0")
                    ? Colors.orange
                    : Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (data.cancelUser != null)
                  ? const Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 15,
                    )
                  : Text(
                      (data.diketahui == "0")
                          ? "Waiting"
                          : (data.tglDisetujui != null)
                              ? fmt.format(
                                  DateTime.parse("${data.tglDisetujui}"))
                              : "Waiting",
                      style: const TextStyle(color: Colors.white, fontSize: 9),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            elevation: 10,
            color: Colors.blue,
            child: InkWell(
              onTap: () async {
                await Get.toNamed(Routes.DETAIL_KABAG, arguments: {
                  "idHeader": "${data.idHeaderRKB}",
                  "noRkb": "${data.noRkb}"
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Detail",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
          if (data.cancelUser == null)
            if (data.diketahui != "0")
              Card(
                elevation: 10,
                child: InkWell(
                  onTap: () async {
                    await Get.toNamed(Routes.RKB_PDF,
                        arguments: {"noRkb": data.noRkb});
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "PDF",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
          if (data.disetujui == "0")
            if (data.cancelUser == null)
              if (data.userClose == null)
                Card(
                  elevation: 10,
                  color: const Color.fromARGB(255, 44, 174, 49),
                  child: InkWell(
                    onTap: () async {
                      await approve(username, "${data.noRkb}");
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Approve",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
          if (data.disetujui == "0")
            if (data.cancelUser == null)
              Card(
                elevation: 10,
                color: Colors.red,
                child: InkWell(
                  onTap: () async {
                    cancel();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Batalkan",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget closeRemark() {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text("${data.cancelRemark}"),
        ),
      ],
    );
  }

  Widget cancelRemark() {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${data.cancelUser}"),
              Text("${data.remarkCancel}"),
            ],
          ),
        ),
      ],
    );
  }

  approve(username, noRkb) async {
    var provider = Provider();
    var body = ApprovePost();
    body.username = username;
    body.noRkb = noRkb;
    bool doApprove = await Get.defaultDialog(
        title: "Approve",
        middleText: "Apakah anda yakin ingin melakukan Approve?",
        confirm: ElevatedButton(
          onPressed: () {
            Get.back(result: true);
          },
          style: ElevatedButton.styleFrom(primary: Colors.green),
          child: const Text(
            "Ya, Approve!",
          ),
        ),
        cancel: ElevatedButton(
          onPressed: () {
            Get.back(result: false);
          },
          style: ElevatedButton.styleFrom(primary: Colors.red),
          child: const Text(
            "Tidak",
          ),
        ),
        barrierDismissible: false);
    if (doApprove) {
      Constants().showAlert(enBtn: false, loading: true);
      await provider.approveRkbKabag(body).then((value) {
        if (value.approve!) {
          Get.back();
          controller.onRefresh();
          Get.snackbar("Approve", "Approve RKB ${body.noRkb} Berhasil! ",
              backgroundColor: Colors.green, colorText: Colors.white);
        } else {
          Get.back();
          Get.snackbar("Approve", "Approve RKB ${body.noRkb} Berhasil! ",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
    }
  }

  cancel() async {
    await Get.defaultDialog(
      title: "Batalkan RKB",
      content: SizedBox(
        width: Get.width,
        child: Form(
          key: controller.formKey,
          child: inputBox(controller.remarks, controller.remarksFocus, 3,
              "Keterangan Pembatalan"),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back(result: false);
          controller.remarks.clear();
        },
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: const Text("Tidak"),
      ),
      confirm: ElevatedButton(
        onPressed: () async {
          var provider = Provider();
          if (controller.formKey.currentState!.validate()) {
            var body = CancelRKB();
            body.noRkb = data.noRkb;
            body.username = username;
            body.section = section;
            body.remarks = controller.remarks.text.toString();
            Get.back();
            Constants().showAlert(enBtn: false, loading: true);

            await provider.cancelRKB(body).then((value) {
              if (value.approve!) {
                Get.back();
                Get.snackbar(
                  "Berhasil",
                  "Rkb Telah Di Batalkan!",
                  colorText: Colors.white,
                  backgroundColor: Colors.green,
                );
                controller.remarks.clear();
                controller.onRefresh();
              } else {
                Get.back();

                Get.snackbar(
                  "Error",
                  "Gagal Membatalkan RKB, Coba Lagi!",
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                );
              }
            });
          } else {
            Get.snackbar(
              "Error",
              "Gagal Membatalkan RKB, Coba Lagi!",
              colorText: Colors.white,
              backgroundColor: Colors.red,
            );
          }
        },
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: const Text("Ya , Cancel RKB"),
      ),
      barrierDismissible: false,
    );
  }

  Widget inputBox(TextEditingController remarksCtrl, FocusNode remarksFocus,
      int line, String label) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFormField(
          maxLines: line,
          focusNode: remarksFocus,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: label),
          onSaved: (value) {
            remarksCtrl.text = value!;
          },
          onFieldSubmitted: (term) {
            remarksFocus.unfocus();
          },
          validator: (value) {
            if (value!.isEmpty) {
              return '$label Wajib Di Isi';
            }
            return null;
          },
          controller: remarksCtrl,
        ),
      ),
    );
  }
}
