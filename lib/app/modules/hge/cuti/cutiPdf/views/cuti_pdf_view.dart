import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';

import '../controllers/cuti_pdf_controller.dart';

class CutiPdfView extends GetView<CutiPdfController> {
  const CutiPdfView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  controller.loading.value = false;
                  controller.progress.value = 0.0;
                  Get.defaultDialog(
                    title: "Mengunduh ${controller.judul.value}",
                    content: Obx(
                      () => Column(
                        children: [
                          Center(
                            child: LinearProgressIndicator(
                              minHeight: 10,
                              value: controller.progress.value,
                            ),
                          ),
                          if (controller.loading.value)
                            const Center(
                              child: Text(
                                "Dokumen Telah Diunduh, Tersimpan Diforlder AbpEnergy",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          if (controller.loading.value)
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("OK"),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                  controller.loading.value = await controller
                      .downloadFile(controller.idCutiOnline.value);
                },
                icon: const Icon(Icons.download))
          ],
          leading: IconButton(
            onPressed: () async {
              await controller.deleteFile();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text('${controller.judul.value}'),
          centerTitle: true,
        ),
        body: (controller.loaded.value)
            ? Stack(
                children: [
                  PDFView(
                    filePath: controller.urlPDFPath.value,
                    autoSpacing: true,
                    enableSwipe: true,
                    pageSnap: true,
                    swipeHorizontal: true,
                    nightMode: false,
                    onError: (e) {
                      Text(e.toString());
                    },
                    onRender: (pages) {
                      controller.totalPages.value = pages;
                      controller.pdfReady.value = true;
                    },
                    onViewCreated: (PDFViewController vc) {
                      controller.pdfViewController = vc;
                    },
                    onPageChanged: (page, total) {
                      controller.currentPage.value = page;
                    },
                    onPageError: (page, e) {},
                  ),
                  // zoomInOut(),
                ],
              )
            : const Center(
                child: CupertinoActivityIndicator(
                  radius: 30,
                  color: Colors.black,
                ),
              ),
      ),
    );
  }

  Widget zoomInOut() {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 50,
        height: 100,
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                controller.pdfViewController.getCurrentPage();
              },
              icon: const Icon(
                Icons.zoom_in,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.zoom_out, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
