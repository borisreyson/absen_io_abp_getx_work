import 'package:get/get.dart';

import '../controllers/rkb_detail_controller.dart';

class RkbDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbDetailController>(
      () => RkbDetailController(),
    );
  }
}
