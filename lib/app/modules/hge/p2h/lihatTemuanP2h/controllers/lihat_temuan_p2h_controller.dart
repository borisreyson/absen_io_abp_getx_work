import 'package:get/get.dart';
import 'package:face_id_plus/app/data/models/p2h_temuan_models.dart';
import 'package:face_id_plus/app/data/models/p2h_sarana_models.dart';
import '../../../../../data/providers/p2h_provider.dart';

class LihatTemuanP2hController extends GetxController {
  final provider = P2hProvider();
  final detailP2h = Data().obs;
  final data = <P2hTemuan>[].obs;
  final basUrl =
      "https://lp.abpjobsite.com/api/v1/p2h/view/p2h/image?file_name=";
  final loaded = false.obs;

  @override
  void onInit() {
    var res = Get.arguments['data'];
    if (res != null) {
      detailP2h.value = res;
      getTemuan(res.p2hUniqid);
    }
    super.onInit();
  }

  getTemuan(uniqid) async {
    await provider.getP2hTemuan(uniqid).then((value) {
      var result = value.p2hTemuan;
      if (result != null) {
        data.addAll(result);
        loaded.value = true;
      } else {
        loaded.value = false;
      }
    });
  }
}
