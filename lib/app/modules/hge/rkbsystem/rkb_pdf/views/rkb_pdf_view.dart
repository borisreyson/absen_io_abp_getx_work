import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';

import '../controllers/rkb_pdf_controller.dart';

class RkbPdfView extends GetView<RkbPdfController> {
  const RkbPdfView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              await controller.deleteFile();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text('${controller.noRkb.value}'),
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
              onPressed: () {},
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
