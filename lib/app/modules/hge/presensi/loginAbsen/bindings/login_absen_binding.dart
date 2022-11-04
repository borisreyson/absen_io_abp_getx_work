import 'package:get/get.dart';

import '../controllers/login_absen_controller.dart';

class LoginAbsenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginAbsenController>(
      () => LoginAbsenController(),
    );
  }
}
