import 'package:get/get.dart';

import '../controllers/tambah_sarana_controller.dart';

class TambahSaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahSaranaController>(
      () => TambahSaranaController(),
    );
  }
}
