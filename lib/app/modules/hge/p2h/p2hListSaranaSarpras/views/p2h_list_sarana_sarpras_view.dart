import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/models/listSaranaHeader.dart';
import '../controllers/p2h_list_sarana_sarpras_controller.dart';

class P2hListSaranaSarprasView extends GetView<P2hListSaranaSarprasController> {
  const P2hListSaranaSarprasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: const Text(
            'List Sarana',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: (controller.listSarana.isNotEmpty)
            ? ListView(
                children:
                    controller.listSarana.map((e) => cardListarana(e)).toList(),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
      ),
    );
  }

  Widget cardListarana(Data e) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${e.noLv}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${e.noPol}",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "${e.merekType} ${e.jenis}",
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed(Routes.LIST_ALL_P2_H,
                        arguments: {"dataSarana": e});
                  },
                  label: const Text("Data P2H"),
                  icon: const Icon(CupertinoIcons.list_bullet_below_rectangle),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 1,
            width: Get.width,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
