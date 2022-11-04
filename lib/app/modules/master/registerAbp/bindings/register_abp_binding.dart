import 'package:get/get.dart';

import '../controllers/register_abp_controller.dart';

class RegisterAbpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterAbpController>(
      () => RegisterAbpController(),
    );
  }
}
