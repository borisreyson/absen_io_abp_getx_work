import 'package:get/get.dart';

import '../controllers/list_buletin_controller.dart';

class ListBuletinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListBuletinController>(
      () => ListBuletinController(),
    );
  }
}
