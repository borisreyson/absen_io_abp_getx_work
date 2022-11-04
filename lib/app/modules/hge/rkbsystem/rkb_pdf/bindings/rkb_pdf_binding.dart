import 'package:get/get.dart';

import '../controllers/rkb_pdf_controller.dart';

class RkbPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbPdfController>(
      () => RkbPdfController(),
    );
  }
}
