import 'package:get/get.dart';

class ViewImageController extends GetxController {
  final url = RxnString(null);

  @override
  void onInit() {
    var uri = Get.arguments['urlImage'];
    if (uri != null) {
      url.value = uri;
    }
    super.onInit();
  }
}
