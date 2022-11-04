import 'package:face_id_plus/app/data/utils/custom_footer.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/models/listSaranaHeader.dart';
import '../controllers/list_sarana_controller.dart';

class ListSaranaView extends GetView<ListSaranaController> {
  const ListSaranaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 219, 132, 2),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: const Text('Unit Sarana'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.TAMBAH_SARANA);
                },
                icon: const Icon(CupertinoIcons.add_circled_solid))
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 212, 211, 211),
        body: SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: true,
          enablePullUp: controller.pullUp.value,
          onLoading: controller.onLoading,
          onRefresh: controller.onRefresh,
          footer: const MyCustomFooter(),
          header: const WaterDropMaterialHeader(
              backgroundColor: Colors.blue, color: Colors.white),
          child: ListView(
              // ignore: invalid_use_of_protected_member
              children: controller.listSarana.value
                  .map((e) => cardSarana(e))
                  .toList()),
        ),
      ),
    );
  }

  Widget cardSarana(Data e) {
    return Card(
        elevation: 10,
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.DETAIL_SARANA, arguments: {"data": e});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${e.noLv}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${e.noPol}",
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("PIC"),
                    Text("${e.nama}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.DETAIL_SARANA,
                            arguments: {"data": e});
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: const Text("Detail"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.RUBAH_SARANA,
                            arguments: {"no": e.saranaId});
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      child: const Text("Rubah"),
                    ),
                    if (e.flagHeader == '0' && e.flagDetail == '0')
                      ElevatedButton(
                        onPressed: () {
                          controller.enDis("${e.saranaId}", 1);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: const Text("Hapus "),
                      ),
                    if (e.flagHeader == '1' && e.flagDetail == '1')
                      ElevatedButton(
                        onPressed: () {
                          controller.enDis("${e.saranaId}", 0);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: const Text("Aktifkan"),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
