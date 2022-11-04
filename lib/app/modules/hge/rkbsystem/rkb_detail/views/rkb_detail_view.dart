import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models/rkb_detail_models.dart';
import '../controllers/rkb_detail_controller.dart';

class RkbDetailView extends GetView<RkbDetailController> {
  const RkbDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text("${controller.noRkb.value}"),
            centerTitle: true,
          ),
          body: ListView(
              children:
                  controller.data.map((element) => content(element)).toList())),
    );
  }

  Widget content(RkbDetail data) {
    DateFormat fmt = DateFormat("dd MMMM yyyy");
    var style = const TextStyle(fontWeight: FontWeight.bold);
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Part Number", style: style),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      (data.partNumber != null) ? "${data.partNumber}" : "-"),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Part Name", style: style),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${data.partName}"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("QTY", style: style),
                ),
                Text("${data.quantity} ${data.satuan}"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Remarks", style: style),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${data.remarks}",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Due Date", style: style),
                ),
                Text((data.dueDate != null)
                    ? fmt.format(DateTime.parse("${data.dueDate}"))
                    : "-"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Card(
                //       color: Colors.orange,
                //       elevation: 10,
                //       child: InkWell(
                //         onTap: () {},
                //         child: const Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: Text(
                //             "Tanyakan",
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       )),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      color: Colors.blue,
                      elevation: 10,
                      child: InkWell(
                        onTap: () async {
                          await Get.toNamed(Routes.RKB_LAMPIRAN,
                              arguments: {"noRkb": data.noRkb});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Lampiran",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
