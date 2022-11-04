import 'package:get/get.dart';

import '../controllers/barcode_security_controller.dart';

class BarcodeSecurityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarcodeSecurityController>(
      () => BarcodeSecurityController(),
    );
  }
}
