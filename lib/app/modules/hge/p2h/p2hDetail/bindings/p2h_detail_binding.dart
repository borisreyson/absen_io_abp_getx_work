import 'package:get/get.dart';

import '../controllers/p2h_detail_controller.dart';

class P2hDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<P2hDetailController>(
      () => P2hDetailController(),
    );
  }
}
