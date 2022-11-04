import 'package:get/get.dart';

import '../controllers/list_p2_h_controller.dart';

class ListP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListP2HController>(
      () => ListP2HController(),
    );
  }
}
