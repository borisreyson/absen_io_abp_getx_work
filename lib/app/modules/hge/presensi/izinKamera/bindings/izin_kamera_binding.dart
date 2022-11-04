import 'package:get/get.dart';

import '../controllers/izin_kamera_controller.dart';

class IzinKameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IzinKameraController>(
      () => IzinKameraController(),
    );
  }
}
