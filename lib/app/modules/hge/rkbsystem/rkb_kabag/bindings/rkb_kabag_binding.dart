// ignore: unused_import
import 'package:face_id_plus/app/modules/hge/controllers/navigasi_rkb_controller.dart';
import 'package:get/get.dart';
import '../controllers/rkb_kabag_controller.dart';

class RkbKabagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbKabagController>(
      () => RkbKabagController(),
    );
  }
}
