import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import '../../../../../data/providers/provider.dart';

class RkbPdfController extends GetxController {
  final provider = Provider();
  final loaded = false.obs;
  final noRkb = RxnString(null);
  final urlPDFPath = RxnString(null);
  final totalPages = RxnInt(null);
  final currentPage = RxnInt(null);
  final pdfReady = false.obs;
  late PDFViewController pdfViewController;
  @override
  void onInit() async {
    noRkb.value = await Get.arguments['noRkb'];
    if (noRkb.value != null) {
      await provider
          .getPdfRkb("${noRkb.value}", "${noRkb.replaceAll("/", "_")}")
          .then((docs) {
        if (kDebugMode) {
          print("docs ${docs.absolute}");
        }
        urlPDFPath.value = docs.path;
        loaded.value = true;
      });
    }
    super.onInit();
  }

  deleteFile() async {
    try {
      var file = File("${urlPDFPath.value}");
      await file.delete();
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
  }
}
