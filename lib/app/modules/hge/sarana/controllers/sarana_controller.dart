import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SaranaController extends GetxController {
  final widgetList = <Widget>[].obs;
  final refreshController = RefreshController();
  @override
  void onInit() {
    widgetList.value = [
      cardTambah(),
      listSarana(),
      daftarIsianP2h(),
    ];
    super.onInit();
  }

  Widget cardTambah() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.TAMBAH_SARANA);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 10,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                CupertinoIcons.car_detailed,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Tambah Unit Sarana",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }

  Widget listSarana() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.LIST_SARANA);
      },
      child: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 12, 92, 3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 10,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                CupertinoIcons.car,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "List Unit Sarana",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  Widget daftarIsianP2h() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.MASTER_PEMERIKSAAN_P2_H);
      },
      child: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 3, 51, 92),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 10,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                CupertinoIcons.doc_text,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Daftar Isian P2h",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  void onRefresh() {
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    widgetList.value = [
      cardTambah(),
      listSarana(),
      daftarIsianP2h(),
    ];
  }
}
