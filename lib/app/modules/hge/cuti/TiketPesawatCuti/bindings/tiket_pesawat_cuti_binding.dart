import 'package:get/get.dart';

import '../controllers/tiket_pesawat_cuti_controller.dart';

class TiketPesawatCutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TiketPesawatCutiController>(
      () => TiketPesawatCutiController(),
    );
  }
}
