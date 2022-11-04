import 'package:face_id_plus/app/data/models/pesan_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../data/models/rkb_detail_models.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/detail_kabag_controller.dart';

class DetailKabagView extends GetView<DetailKabagController> {
  const DetailKabagView({Key? key}) : super(key: key);
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      color: Colors.orange,
                      elevation: 10,
                      child: InkWell(
                        onTap: () async {
                          await Get.toNamed(Routes.PESAN,
                              arguments: {"data": data});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Tanyakan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      color: Colors.blue,
                      elevation: 10,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.RKB_LAMPIRAN,
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

  tanyakan(RkbDetail data) async {
    var body = PesanModels();
    body.noRkb = data.noRkb;
    body.partName = data.partName;
    body.usernameTo = data.userEntry;
    body.username = controller.username.value;
    body.tree = 'parent';
    controller.noRkbCtrl.text = "${data.noRkb}";
    controller.partNameCtrl.text = "${data.partName}";

    await Get.defaultDialog(
      title: "Tanyakan Barang ${data.partName}",
      titleStyle: const TextStyle(fontSize: 10),
      content: SizedBox(
        height: Get.height / 2,
        width: Get.width,
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                inputBox(controller.noRkbCtrl, controller.noRkbFocus, 1,
                    "Nomor RKB", true, false),
                inputBox(controller.partNameCtrl, controller.partNameFocus, 1,
                    "Part Name", true, false),
                inputBox(controller.subjectCtrl, controller.subjectFocus, 1,
                    "Judul", false, true),
                inputBox(controller.pesanCtrl, controller.pesanFocus, 1,
                    "Pesan", true, true),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        body.subject = controller.subjectCtrl.text.toString();
                        body.message = controller.pesanCtrl.text.toString();
                        if (kDebugMode) {
                          print("pesan ${body.noRkb}");
                        }
                      },
                      child: const Text("Kirim"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Batal"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputBox(TextEditingController remarksCtrl, FocusNode remarksFocus,
      int line, String label, bool validate, bool enable) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextFormField(
          enabled: enable,
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
          validator: (validate)
              ? (value) {
                  if (value!.isEmpty) {
                    return '$label Wajib Di Isi';
                  }
                  return null;
                }
              : null,
          controller: remarksCtrl,
        ),
      ),
    );
  }
}
