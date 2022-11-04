import 'package:get/get.dart';

import '../controllers/list_all_p2_h_controller.dart';

class ListAllP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAllP2HController>(
      () => ListAllP2HController(),
    );
  }
}
