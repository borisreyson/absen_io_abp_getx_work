import 'package:get/get.dart';

import '../controllers/profile_abp_controller.dart';

class ProfileAbpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileAbpController>(
      () => ProfileAbpController(),
    );
  }
}
