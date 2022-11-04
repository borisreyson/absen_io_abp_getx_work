import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/barcode_security_controller.dart';

class BarcodeSecurityView extends GetView<BarcodeSecurityController> {
  const BarcodeSecurityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Scanner'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: (controller.noidOut.value != null)
              ? ListView(
                  children: [
                    qrCode(),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(
                      child: Text(
                        "Scan Barcode Ini Kepada Security!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: Text(
                    "Kode Tidak Benar!",
                  ),
                ),
        ),
      ),
    );
  }

  Widget qrCode() {
    return SizedBox(
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BarcodeWidget(
            barcode: Barcode.qrCode(
              errorCorrectLevel: BarcodeQRCorrectionLevel.high,
            ),
            data: "${controller.noidOut.value}",
          ),
          SizedBox(
            width: 130,
            height: 130,
            child: Image.asset(
              "assets/abpicon_black.png",
            ),
          ),
        ],
      ),
    );
  }
}
