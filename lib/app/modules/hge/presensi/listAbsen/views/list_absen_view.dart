import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../data/models/last_absen_model.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/list_absen_controller.dart';

class ListAbsenView extends GetView<ListAbsenController> {
  const ListAbsenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            backgroundColor: (controller.status == "masuk")
                ? const Color.fromARGB(255, 12, 118, 15)
                : const Color.fromARGB(255, 160, 23, 13),
            title: const Text('List Absen'),
            centerTitle: true,
          ),
          body: SmartRefresher(
            enablePullUp: true,
            onRefresh: controller.doRefresh,
            controller: controller.pullRefresh,
            onLoading: controller.loadingPage,
            child: ListView(
              children: controller.listAbsen.map((e) => _cardAbsen(e)).toList(),
            ),
          )),
    );
  }

  Widget _cardAbsen(Presensi absen) {
    DateFormat fmt = DateFormat("dd MMMM yyyy");
    var tgl = DateTime.parse("${absen.tanggal}");
    TextStyle style = const TextStyle(fontSize: 12, color: Colors.white);
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 20),
          elevation: 10,
          shadowColor: Colors.black87,
          color: const Color.fromARGB(255, 203, 199, 199),
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.DETAIL_ABSENSI,
                  arguments: {"detail": absen, "fromList": true});
            },
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    (absen.faceIn != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: imageResolve("${absen.faceIn}"),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              color: Colors.white,
                              child: const Icon(
                                Icons.person,
                                size: 100,
                              ),
                            ),
                          ),
                    (absen.faceOut != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: imageResolve("${absen.faceOut}"),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              color: Colors.white,
                              child: const Icon(
                                Icons.person,
                                size: 100,
                              ),
                            ),
                          ),
                  ],
                ),
                Text(
                  fmt.format(tgl),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${controller.nama.value}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${absen.nik}",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Masuk",
                                  style: style,
                                ),
                                Text(
                                  (absen.checkin != null)
                                      ? "${absen.checkin}"
                                      : "-",
                                  style: style,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Pulang",
                                  style: style,
                                ),
                                Text(
                                  (absen.checkout != null)
                                      ? "${absen.checkout}"
                                      : '-',
                                  style: style,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget imageResolve(String gambar) {
    return CachedNetworkImage(
      imageUrl: gambar,
      fit: BoxFit.cover,
      height: 100,
      width: 100,
    );
  }
}
