import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_p2_h_controller.dart';

class MenuP2HView extends GetView<MenuP2HController> {
  const MenuP2HView({Key? key}) : super(key: key);
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
            'P2H Sarana',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: (controller.rule.value != null)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        scanQrSarana(),
                        formP2hSarana(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        listP2hSarana(),
                        listAllP2hSarana(),
                      ],
                    ),
                    if (controller.rule.value!.contains("kordinator sarpras"))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          listP2hSarpras(),
                          listAllP2hSarpras(),
                        ],
                      ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
      ),
    );
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Pindai QrCode"),
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Form P2h Sarana"),
            )
          ],
        ),
      ),
    );
  }

  Widget listP2hSarana() {
    return InkWell(
      onTap: () async {
        var daftar = await Get.toNamed(Routes.P2H_LIST_SARANA);
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Daftar P2h Sarana"),
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Daftar P2h Harian"),
            )
          ],
        ),
      ),
    );
  }

  Widget listP2hSarpras() {
    return InkWell(
      onTap: () async {
        var daftar = await Get.toNamed(Routes.P2H_LIST_SARANA_SARPRAS);
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Daftar P2h Sarana"),
            )
          ],
        ),
      ),
    );
  }

  Widget listAllP2hSarpras() {
    return InkWell(
      onTap: () async {
        var daftar = await Get.toNamed(Routes.LIST_P2H_SARPRAS);
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Daftar P2h Harian"),
            )
          ],
        ),
      ),
    );
  }
}
