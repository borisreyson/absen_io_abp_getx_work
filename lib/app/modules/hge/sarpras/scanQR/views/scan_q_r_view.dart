import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scan_q_r_controller.dart';

class ScanQRView extends GetView<ScanQRController> {
  const ScanQRView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Scanner",
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          ),
          actions: [
            IconButton(
              onPressed: (controller.isStarted.value)
                  ? () async {
                      controller.scanner?.stop();
                      controller.isStarted.value = false;
                    }
                  : () async {
                      if (controller.scanner == null) {
                        controller.scanner = MobileScannerController();

                        controller.scanner!.start();
                        controller.isStarted.value = true;
                      } else {
                        if (controller.scanner!.isStarting) {
                          controller.isStarted.value = true;
                        } else {
                          controller.scanner = MobileScannerController();
                          controller.scanner!.start();
                          controller.isStarted.value = true;
                        }
                      }
                    },
              icon: Icon((controller.isStarted.value)
                  ? Icons.stop
                  : Icons.play_arrow_rounded),
            )
          ],
        ),
        body: (controller.isStarted.value)
            ? qrCodeWidget(context)
            : Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (controller.scanner != null) {
                      if (controller.scanner!.isStarting) {
                        controller.isStarted.value = true;
                      } else {
                        controller.scanner = MobileScannerController();
                        controller.scanner?.start();
                        controller.isStarted.value = true;
                      }
                    } else {
                      controller.scanner = MobileScannerController();
                      controller.scanner?.start();
                      controller.isStarted.value = true;
                    }
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text("Start Scanner"),
                ),
              ),
      ),
    );
  }

  Widget qrCodeWidget(context) {
    return Stack(
      children: [
        MobileScanner(
          fit: BoxFit.contain,
          controller: controller.scanner,
          // allowDuplicates: false,
          onDetect: (barcode, args)async {
            if (barcode.rawValue != null) {
              controller.resultQr.value = barcode.rawValue!;
              await controller.updateIzin(barcode.rawValue);
            } else {
              controller.resultQr.value = "Scann Disini";
            }
            print("args $args");
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            color: Colors.black.withOpacity(0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (Uri.parse(controller.resultQr.value).isAbsolute)
                    ? InkWell(
                        onTap: () async {
                          await controller
                              .gotoUrl(Uri.parse(controller.resultQr.value));
                        },
                        child: Center(
                          child: SizedBox(
                            width: Get.width - 120,
                            height: 50,
                            child: FittedBox(
                              child: Text(
                                "Sentuh Disini ${controller.resultQr.value}",
                                overflow: TextOverflow.fade,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: SizedBox(
                          width: Get.width - 120,
                          height: 50,
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (controller.resultQr.value == "Scan Code!")
                                  Text(
                                    controller.resultQr.value,
                                    overflow: TextOverflow.fade,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(color: Colors.white),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
