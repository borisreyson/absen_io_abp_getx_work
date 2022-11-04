import 'package:get/get.dart';

import '../controllers/cuti_pdf_controller.dart';

class CutiPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CutiPdfController>(
      () => CutiPdfController(),
    );
  }
}
