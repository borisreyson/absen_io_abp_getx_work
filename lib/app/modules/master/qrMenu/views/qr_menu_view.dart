import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/qr_menu_controller.dart';

class QrMenuView extends GetView<QrMenuController> {
  const QrMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR-Menu'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 194, 191, 191),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.QR_CODE);
                },
                radius: 40,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.qrcode_viewfinder,
                        size: Get.width / 3,
                        color: Colors.green,
                      ),
                      Text(
                        "Scanner",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.QR_CODE_RESULT);
                },
                radius: 40,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.qrcode,
                        size: Get.width / 3,
                        color: Colors.orange,
                      ),
                      Text(
                        "QR-Code",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
