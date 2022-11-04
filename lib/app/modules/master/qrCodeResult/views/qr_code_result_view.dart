import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/qr_code_result_controller.dart';

class QrCodeResultView extends GetView<QrCodeResultController> {
  const QrCodeResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'QR Code Scanner',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                (controller.loaded.value)
                    ? ListView(
                        children: [
                          if (controller.idQrCode.value != null) qrCode(),
                          if (controller.idQrCode.value != null)
                            const SizedBox(
                              height: 50,
                            ),
                          if (controller.idQrCode.value != null)
                            Center(
                              child: Text(
                                "${controller.titleQrCode}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (controller.idQrCode.value == null)
                            const Center(
                              child: Text(
                                "Kode Tidak Benar!",
                              ),
                            ),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                optionQr(),
              ],
            )),
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
            data: "${controller.idQrCode.value}",
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

  Widget optionQr() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Table(
          children: [
            TableRow(
              children: [
                Card(
                  color: Colors.deepOrange,
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      controller.generateQrInspeksi();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "QR-Code Inspeksi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      controller.generateQrProfile();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "QR-Code Profile User",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
