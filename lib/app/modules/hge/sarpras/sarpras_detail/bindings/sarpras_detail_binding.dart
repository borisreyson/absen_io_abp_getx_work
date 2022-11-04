import 'package:get/get.dart';

import '../controllers/sarpras_detail_controller.dart';

class SarprasDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasDetailController>(
      () => SarprasDetailController(),
    );
  }
}
