import 'package:get/get.dart';

import '../controllers/detail_hazard_controller.dart';

class DetailHazardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHazardController>(
      () => DetailHazardController(),
    );
  }
}
