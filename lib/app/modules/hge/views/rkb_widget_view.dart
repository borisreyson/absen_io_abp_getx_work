import 'package:face_id_plus/app/data/models/rkb_models.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RkbWidgetView extends GetView {
  final Data data;
  const RkbWidgetView({required this.data, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 30, top: 10, left: 10, right: 10),
      elevation: 10,
      child: InkWell(
        onTap: () async {
          await Get.toNamed(Routes.RKB_DETAIL, arguments: {
            "idHeader": "${data.idHeaderRKB}",
            "noRkb": "${data.noRkb}"
          });
        },
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
      ),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: (data.cancelUser != null)
          ? Colors.red
          : (data.diketahui == "0")
              ? Colors.orange
              : Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${data.noRkb}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          const Text(
            "2 Items",
            style: TextStyle(color: Colors.white),
          ),
        ],
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
                        style: const TextStyle(color: Colors.white, fontSize: 9),
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
                await Get.toNamed(Routes.RKB_DETAIL, arguments: {
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
              Card(
                elevation: 10,
                color: Colors.red,
                child: InkWell(
                  onTap: () {},
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
}
