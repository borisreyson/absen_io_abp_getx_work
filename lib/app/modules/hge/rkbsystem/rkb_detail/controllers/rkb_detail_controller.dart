import 'package:get/get.dart';

import '../../../../../data/models/rkb_detail_models.dart';
import '../../../../../data/providers/provider.dart';

class RkbDetailController extends GetxController {
  final provider = Provider();
  final idHeader = RxnString();
  final noRkb = RxnString();
  final data = <RkbDetail>[].obs;
  @override
  void onInit() {
    idHeader.value = Get.arguments['idHeader'];
    noRkb.value = Get.arguments['noRkb'];

    getDetail();
    super.onInit();
  }



  getDetail() async {
    await provider.getRkbDetail(idHeader.value).then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        if (value.rkbDetail != null) {
          data.addAll(value.rkbDetail!);
        }
      }
    });
  }
}
