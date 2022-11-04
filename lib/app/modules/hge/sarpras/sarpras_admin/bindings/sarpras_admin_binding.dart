import 'package:get/get.dart';

import '../controllers/sarpras_admin_controller.dart';

class SarprasAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasAdminController>(
      () => SarprasAdminController(),
    );
  }
}
