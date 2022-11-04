import 'package:face_id_plus/app/data/models/detail_sarana_model.dart';
import 'package:face_id_plus/app/data/providers/sarana_provider.dart';
import 'package:get/get.dart';

class RubahSaranaController extends GetxController {
  final provider = SaranaProvider();
  final loaded = false.obs;
  final data = DetailSarana().obs;
  final no = RxnInt(null);
  @override
  void onInit() async {
    var result = await Get.arguments['no'];
    print("$result");
    if (result != null) {
      no.value = result;
      getDetailSarana(no.value);
    } else {
      loaded.value = false;
    }
    super.onInit();
  }

  getDetailSarana(no) async {
    await provider.getDetailSarana(no).then((value) {
      if (value != null) {
        var sarana = value.detailSarana;
        if (sarana != null) {
          data.value = sarana;
          loaded.value = true;
        } else {
          loaded.value = false;
        }
      } else {
        loaded.value = false;
      }
    }).onError((error, stackTrace) {
      loaded.value = false;
    });
  }
}
