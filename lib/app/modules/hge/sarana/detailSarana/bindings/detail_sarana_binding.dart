import 'package:get/get.dart';

import '../controllers/detail_sarana_controller.dart';

class DetailSaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSaranaController>(
      () => DetailSaranaController(),
    );
  }
}
