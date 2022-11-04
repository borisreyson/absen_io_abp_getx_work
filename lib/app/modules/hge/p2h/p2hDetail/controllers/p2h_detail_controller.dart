import 'package:face_id_plus/app/data/models/p2h_temuan_models.dart';
import 'package:face_id_plus/app/data/providers/p2h_provider.dart';
import 'package:get/get.dart';
import 'package:face_id_plus/app/data/models/p2h_sarana_models.dart';
import 'package:intl/intl.dart';

class P2hDetailController extends GetxController {
  final provider = P2hProvider();
  final detailP2h = Data().obs;
  final listTemuan = <P2hTemuan>[].obs;
  final basUrl =
      "https://lp.abpjobsite.com/api/v1/p2h/view/p2h/image?file_name=";
  final fmt = DateFormat('dd MMMM yyyy');

  @override
  void onInit() async {
    var res = await Get.arguments['detailP2h'];
    if (res != null) {
      detailP2h.value = res;
      getTemuan(detailP2h.value.p2hUniqid);
    }

    super.onInit();
  }

  getTemuan(uniqid) async {
    await provider.getP2hTemuan(uniqid).then((value) {
      var result = value.p2hTemuan;
      if (result != null) {
        listTemuan.addAll(result);
      }
    });
  }
}
