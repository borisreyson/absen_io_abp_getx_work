import 'package:get/get.dart';

import '../controllers/list_sarana_controller.dart';

class ListSaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSaranaController>(
      () => ListSaranaController(),
    );
  }
}
