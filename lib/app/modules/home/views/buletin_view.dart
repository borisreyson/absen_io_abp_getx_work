import 'package:face_id_plus/app/modules/home/controllers/home_controller.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../buletin_model.dart';

class BuletinView extends GetView<HomeController> {
  const BuletinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.loaded.value)
        ? SmartRefresher(
            enablePullDown: true,
            header: const WaterDropMaterialHeader(),
            onLoading: controller.onLoading,
            controller: controller.pullRefresh,
            onRefresh: controller.onRefresh,
            enablePullUp: controller.pullUp.value,
            child: ListView(
              children: controller.dataBuletin.map((e) => _content(e)).toList(),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(color: Colors.black),
          ));
  }

  Widget _content(Data list) {
    DateFormat fmt = DateFormat("dd MMMM yyyy");
    var tanggal = DateTime.parse("${list.tgl}");
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () async {
          await Get.toNamed(Routes.BULETIN, arguments: {"buletin": list});
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    fmt.format(tanggal),
                    textAlign: TextAlign.right,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListTile(
                  title: Text("${list.judul}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text("\n${list.pesan}", maxLines: 6),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
