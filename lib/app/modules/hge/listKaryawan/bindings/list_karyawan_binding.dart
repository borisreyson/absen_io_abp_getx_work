import 'package:get/get.dart';

import '../controllers/list_karyawan_controller.dart';

class ListKaryawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListKaryawanController>(
      () => ListKaryawanController(),
    );
  }
}
