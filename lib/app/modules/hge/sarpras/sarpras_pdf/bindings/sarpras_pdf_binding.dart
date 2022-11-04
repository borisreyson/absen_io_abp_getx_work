import 'package:get/get.dart';

import '../controllers/sarpras_pdf_controller.dart';

class SarprasPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasPdfController>(
      () => SarprasPdfController(),
    );
  }
}
