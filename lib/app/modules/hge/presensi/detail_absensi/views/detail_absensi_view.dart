import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_absensi_controller.dart';

class DetailAbsensiView extends GetView<DetailAbsensiController> {
  const DetailAbsensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(color: Colors.white);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            (controller.detail.value.tanggal != null)
                ? controller.fmt.format(
                    DateTime.parse("${controller.detail.value.tanggal}"),
                  )
                : "-",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.VIEW_IMAGE, arguments: {
                        "urlImage": controller.detail.value.faceIn
                      });
                    },
                    child: CachedNetworkImage(
                        placeholder: (contex, url) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image_rounded,
                              size: 150,
                              color: Color.fromARGB(255, 235, 104, 95),
                            ),
                          );
                        },
                        fit: BoxFit.contain,
                        width: Get.width / 2.2,
                        imageUrl: "${controller.detail.value.faceIn}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.VIEW_IMAGE, arguments: {
                        "urlImage": controller.detail.value.faceOut
                      });
                    },
                    child: CachedNetworkImage(
                        placeholder: (contex, url) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image_rounded,
                              size: 150,
                              color: Color.fromARGB(255, 235, 104, 95),
                            ),
                          );
                        },
                        width: Get.width / 2.2,
                        fit: BoxFit.contain,
                        imageUrl: "${controller.detail.value.faceOut}"),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Masuk",
                            style: style,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            (controller.detail.value.checkin != null)
                                ? "${controller.detail.value.checkin}"
                                : "",
                            style: style,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Pulang",
                            style: style,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            (controller.detail.value.checkout != null)
                                ? "${controller.detail.value.checkout}"
                                : "",
                            style: style,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "${controller.nama.value}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "${controller.detail.value.nik}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
