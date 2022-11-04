import 'package:get/get.dart';

import '../controllers/detail_kabag_controller.dart';

class DetailKabagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKabagController>(
      () => DetailKabagController(),
    );
  }
}
