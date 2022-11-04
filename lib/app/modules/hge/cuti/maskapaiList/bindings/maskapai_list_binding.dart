import 'package:get/get.dart';

import '../controllers/maskapai_list_controller.dart';

class MaskapaiListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaskapaiListController>(
      () => MaskapaiListController(),
    );
  }
}
