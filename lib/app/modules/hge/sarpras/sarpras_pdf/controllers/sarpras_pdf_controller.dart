import 'dart:io';

import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import '../../../../../data/providers/provider.dart';

class SarprasPdfController extends GetxController {
  final provider = Provider();
  final loaded = false.obs;
  final noSarpras = RxnString(null);
  final urlPDFPath = RxnString(null);
  final totalPages = RxnInt(null);
  final currentPage = RxnInt(null);

  final pdfReady = false.obs;
  late PDFViewController pdfViewController;
  @override
  void onInit() async {
    noSarpras.value = await Get.arguments['noSarpras'];
    if (noSarpras.value != null) {
      await provider
          .getPdfSarpras("${noSarpras.value}", "$noSarpras")
          .then((docs) {
        if (docs != null) {
          print("docs ${docs.absolute}");
          urlPDFPath.value = docs.path;
          loaded.value = true;
        }
      });
    }
    super.onInit();
  }

  deleteFile() async {
    try {
      var file = File("${urlPDFPath.value}");
      await file.delete();
    } catch (e) {
      print("error $e");
    }
  }
}
