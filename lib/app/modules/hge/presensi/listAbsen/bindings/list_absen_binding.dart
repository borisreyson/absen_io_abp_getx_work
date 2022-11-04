import 'package:get/get.dart';

import '../controllers/list_absen_controller.dart';
import '../controllers/nav_list_absen_controller.dart';

class ListAbsenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavListAbsenController>(
      () => NavListAbsenController(),
    );
    Get.lazyPut<ListAbsenController>(
      () => ListAbsenController(),
    );
  }
}
