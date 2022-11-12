import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/qr_code_controller.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeView extends GetView<QrCodeController> {
  const QrCodeView({Key? key}) : super(key: key);
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
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
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
          onDetect: (barcode, args) async {
            if (barcode.rawValue != null) {
              controller.resultQr.value = barcode.rawValue!;
              if (!Uri.parse(controller.resultQr.value).isAbsolute) {
                var saranaId = controller.resultQr.value.split('/');
                if (saranaId.contains("p2h")) {
                  controller.scanner?.stop();
                  controller.isStarted.value = false;
                  await Get.toNamed(Routes.MENU_FORM_P2H,
                      arguments: {"saranaId": saranaId});
                  controller.scanner = MobileScannerController();
                  controller.scanner?.start();
                  controller.isStarted.value = true;
                }
              }
            } else {
              controller.resultQr.value = "Scann Disini";
            }
            if (kDebugMode) {
              print("args $args");
            }
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
                                Text(
                                  controller.resultQr.value,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.white),
                                ),
                                if (controller.resultQr.value != "Scan Code!")
                                  IconButton(
                                      onPressed: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                              text: controller.resultQr.value),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.copy_rounded,
                                        size: 50,
                                        color: Colors.white,
                                      ))
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        Center(
            child: SizedBox(
          width: Get.width / 1.3,
          child: const LinearProgressIndicator(
            color: Colors.blue,
            minHeight: 1.5,
          ),
        ))
      ],
    );
  }
}
