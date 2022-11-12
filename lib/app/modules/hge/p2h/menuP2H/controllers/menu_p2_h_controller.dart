import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuP2HController extends GetxController {
  final rule = RxnString(null);
  final listMenu = [].obs;
  @override
  void onInit() {
    getPref();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    rule.value = pref.getString(Constants.rule);
    if (rule.value!.contains("kordinator sarpras")) {
      listMenu.value = [
        listP2hSarpras(),
        listAllP2hSarpras(),
      ];
    } else {
      listMenu.value = [
        scanQrSarana(),
        formP2hSarana(),
        listP2hSarana(),
        listAllP2hSarana(),
      ];
    }
  }

  Widget scanQrSarana() {
    return InkWell(
      onTap: () async {
        var scan = await Get.toNamed(Routes.SCAN_SARANA_P2_H);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Card(
              color: Colors.red,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.qrcode_viewfinder,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Pindai QrCode", textAlign: TextAlign.center),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget formP2hSarana() {
    return InkWell(
      onTap: () async {
        var res = await Get.toNamed(Routes.P2H_LIST_SARANA);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Card(
              color: Colors.blue,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.doc_plaintext,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Form P2h Sarana", textAlign: TextAlign.center),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listP2hSarana() {
    return InkWell(
      onTap: () async {
        var daftar = await Get.toNamed(Routes.DAFTAR_P2H_HARIAN);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Card(
              color: Colors.orange,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.list_bullet_below_rectangle,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Daftar P2h Sarana", textAlign: TextAlign.center),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listAllP2hSarana() {
    return InkWell(
      onTap: () async {
        var daftar = await Get.toNamed(Routes.LIST_ALL_P2_H);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Card(
              color: Colors.green,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.list_bullet_below_rectangle,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Daftar P2h Harian", textAlign: TextAlign.center),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listP2hSarpras() {
    return InkWell(
      onTap: () async {
        var daftar = await Get.toNamed(Routes.DAFTAR_P2H_HARIAN);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Card(
              color: Colors.purple,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.list_bullet_below_rectangle,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Daftar P2h Sarana", textAlign: TextAlign.center),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listAllP2hSarpras() {
    return InkWell(
      onTap: () async {
        var daftar = await Get.toNamed(Routes.LIST_ALL_P2_H);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Card(
              color: Colors.black,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.list_bullet_below_rectangle,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Daftar P2h Harian",
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
