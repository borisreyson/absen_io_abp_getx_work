import 'package:get/get.dart';
import '../views/grafik_kehadiran_view.dart';

class GrafikKehadiranController extends GetxController {
  final data = <Sales>[].obs;

  @override
  void onReady() {
    data.value = <Sales>[
      Sales("a", 111),
      Sales("b", 222),
      Sales("c", 333),
      Sales("d", 444),
      Sales("e", 555),
      Sales("f", 666),
      Sales("g", 777),
    ];
    super.onReady();
  }

  @override
  void onClose() {}
}
