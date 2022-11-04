import 'package:get/get.dart';

import '../controllers/alarm_player_controller.dart';

class AlarmPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlarmPlayerController>(
      () => AlarmPlayerController(),
    );
  }
}
