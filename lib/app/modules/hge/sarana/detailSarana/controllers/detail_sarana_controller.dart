import 'package:get/get.dart';

import '../../../../../data/models/listSaranaHeader.dart';

class DetailSaranaController extends GetxController {
  final loaded = false.obs;
  final data = Data().obs;
  @override
  void onInit() async {
    var result = await Get.arguments['data'];
    if (result != null) {
      data.value = result;
      loaded.value = true;
    } else {
      loaded.value = false;
    }
    super.onInit();
  }
}
