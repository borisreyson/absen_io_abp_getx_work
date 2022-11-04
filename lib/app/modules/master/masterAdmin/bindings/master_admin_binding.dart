import 'package:get/get.dart';

import '../controllers/master_admin_controller.dart';

class MasterAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterAdminController>(
      () => MasterAdminController(),
    );
  }
}
