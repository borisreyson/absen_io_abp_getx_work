import 'package:get/get.dart';

import '../controllers/qr_code_result_controller.dart';

class QrCodeResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrCodeResultController>(
      () => QrCodeResultController(),
    );
  }
}
