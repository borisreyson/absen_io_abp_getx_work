import 'package:get/get.dart';

import '../controllers/list_p2h_sarpras_controller.dart';

class ListP2hSarprasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListP2hSarprasController>(
      () => ListP2hSarprasController(),
    );
  }
}
