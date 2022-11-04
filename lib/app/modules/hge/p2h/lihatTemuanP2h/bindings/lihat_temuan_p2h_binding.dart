import 'package:get/get.dart';

import '../controllers/lihat_temuan_p2h_controller.dart';

class LihatTemuanP2hBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LihatTemuanP2hController>(
      () => LihatTemuanP2hController(),
    );
  }
}
