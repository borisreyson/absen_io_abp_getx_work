import 'package:get/get.dart';

import '../controllers/list_cuti_controller.dart';

class ListCutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListCutiController>(
      () => ListCutiController(),
    );
  }
}
